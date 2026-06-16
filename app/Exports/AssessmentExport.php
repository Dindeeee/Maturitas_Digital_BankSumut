<?php

namespace App\Exports;

use App\Services\ScoringService;
use PhpOffice\PhpSpreadsheet\Chart\Chart;
use PhpOffice\PhpSpreadsheet\Chart\DataSeries;
use PhpOffice\PhpSpreadsheet\Chart\DataSeriesValues;
use PhpOffice\PhpSpreadsheet\Chart\Legend;
use PhpOffice\PhpSpreadsheet\Chart\PlotArea;
use PhpOffice\PhpSpreadsheet\Chart\Title;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class AssessmentExport
{
    private const NILAI_COLORS = [
        1 => 'FF16A34A',
        2 => 'FF4ADE80',
        3 => 'FFFBBF24',
        4 => 'FFF97316',
        5 => 'FFEF4444',
    ];

    private const DOMAIN_PALETTE = [
        '2563eb', 'f58220', '16a34a', 'db2777',
        '7c3aed', '0891b2', 'ca8a04', 'dc2626',
    ];

    private const STATUS_COLORS = [
        'Selesai'          => 'FFDCFCE7',
        'Sedang Diproses'  => 'FFFEF9C3',
        'Pending'          => 'FFF3F4F6',
    ];

    public function __construct(private array $data) {}

    public function write(string $path): void
    {
        $spreadsheet = new Spreadsheet();
        $spreadsheet->removeSheetByIndex(0);

        $this->buildDashboardSheet($spreadsheet);
        $this->buildDomainChartsSheet($spreadsheet);
        $this->buildDetailSheet($spreadsheet);
        $this->buildReviewSheet($spreadsheet);

        $spreadsheet->setActiveSheetIndex(0);

        $writer = new Xlsx($spreadsheet);
        $writer->setIncludeCharts(true);
        $writer->save($path);
    }

    // ── Helper methods ─────────────────────────────────────────────

    private function applyHeaderStyle(Worksheet $sheet, string $range): void
    {
        $style = $sheet->getStyle($range);
        $style->getFont()->setBold(true)->setSize(10);
        $style->getFill()->setFillType(Fill::FILL_SOLID)
            ->getStartColor()->setARGB('FFF3F4F6');
        $style->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
        $style->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);
    }

    private function applyBorders(Worksheet $sheet, string $range): void
    {
        $sheet->getStyle($range)->getBorders()->getAllBorders()
            ->setBorderStyle(Border::BORDER_THIN);
    }

    private function colorNilai(Worksheet $sheet, string $cell, $nilai): void
    {
        if ($nilai && isset(self::NILAI_COLORS[$nilai])) {
            $sheet->getStyle($cell)->getFill()
                ->setFillType(Fill::FILL_SOLID)
                ->getStartColor()->setARGB(self::NILAI_COLORS[$nilai]);
            if (in_array($nilai, [1, 4, 5])) {
                $sheet->getStyle($cell)->getFont()->getColor()->setARGB('FFFFFFFF');
            }
        }
    }

    private function makeBarChart(
        string $name,
        string $chartTitle,
        string $sheetTitle,
        int $firstRow,
        int $lastRow,
        string $labelCol,
        string $dataCol,
        string $topLeft,
        string $bottomRight,
        ?string $fillColor = null,
    ): Chart {
        $count = $lastRow - $firstRow + 1;

        $categories = [new DataSeriesValues(
            DataSeriesValues::DATASERIES_TYPE_STRING,
            "'{$sheetTitle}'!\${$labelCol}\${$firstRow}:\${$labelCol}\${$lastRow}",
            null, $count,
        )];

        $valuesObj = new DataSeriesValues(
            DataSeriesValues::DATASERIES_TYPE_NUMBER,
            "'{$sheetTitle}'!\${$dataCol}\${$firstRow}:\${$dataCol}\${$lastRow}",
            null, $count,
        );

        if ($fillColor) {
            $valuesObj->setFillColor(array_fill(0, $count, $fillColor));
        }

        $series = new DataSeries(
            DataSeries::TYPE_BARCHART,
            DataSeries::GROUPING_CLUSTERED,
            range(0, 0), [], $categories, [$valuesObj],
        );
        $series->setPlotDirection(DataSeries::DIRECTION_COL);

        $plotArea = new PlotArea(null, [$series]);
        $legend   = new Legend(Legend::POSITION_BOTTOM, null, false);
        $title    = new Title($chartTitle);

        $chart = new Chart($name, $title, $legend, $plotArea, true, DataSeries::EMPTY_AS_GAP);
        $chart->setTopLeftPosition($topLeft);
        $chart->setBottomRightPosition($bottomRight);

        return $chart;
    }

    // ── Sheet 1: Dashboard Score ───────────────────────────────────

    private function buildDashboardSheet(Spreadsheet $spreadsheet): void
    {
        $sheet = $spreadsheet->createSheet();
        $sheet->setTitle('Dashboard Score');

        $period    = $this->data['period'];
        $domainRows = $this->data['domainRows'];

        // Title
        $sheet->setCellValue('A1', 'Laporan Asesmen Maturitas Digital — '.$period->name.' ('.$period->year.')');
        $sheet->mergeCells('A1:E1');
        $sheet->getStyle('A1')->getFont()->setBold(true)->setSize(14);

        $sheet->setCellValue('A2', 'Referensi: SEOJK No. 24/SEOJK.03/2023');
        $sheet->mergeCells('A2:E2');
        $sheet->getStyle('A2')->getFont()->setSize(9)->setItalic(true);

        $overall = 'Skor Total: '.($this->data['overallSkor'] ?? '—')
            .'  |  Nilai: '.($this->data['overallNilai'] ?? '—')
            .'  |  '.($this->data['overallCategory'] ?? '—');
        $sheet->setCellValue('A3', $overall);
        $sheet->mergeCells('A3:E3');
        $sheet->getStyle('A3')->getFont()->setBold(true)->setSize(11);

        // Domain table
        $hRow = 5;
        foreach (['Domain', 'Skor', 'Nilai', 'Kategori'] as $i => $h) {
            $sheet->setCellValue(chr(65 + $i).$hRow, $h);
        }
        $this->applyHeaderStyle($sheet, "A{$hRow}:D{$hRow}");

        $row = $hRow + 1;
        foreach ($domainRows as $d) {
            $sheet->setCellValue('A'.$row, $d['code'].'. '.$d['name']);
            $skor  = $d['cache']->skor ?? null;
            $nilai = $d['cache']->nilai ?? null;
            if ($skor !== null) {
                $sheet->setCellValue('B'.$row, (float) $skor);
            }
            if ($nilai !== null) {
                $sheet->setCellValue('C'.$row, (int) $nilai);
                $this->colorNilai($sheet, 'C'.$row, (int) $nilai);
            }
            $sheet->setCellValue('D'.$row, $d['cache']->category ?? '');
            $this->applyBorders($sheet, "A{$row}:D{$row}");
            $row++;
        }

        // Total row
        $tRow = $row;
        $sheet->setCellValue('A'.$tRow, 'Total');
        if ($this->data['overallSkor'] !== null) {
            $sheet->setCellValue('B'.$tRow, (float) $this->data['overallSkor']);
        }
        if ($this->data['overallNilai'] !== null) {
            $sheet->setCellValue('C'.$tRow, (int) $this->data['overallNilai']);
            $this->colorNilai($sheet, 'C'.$tRow, (int) $this->data['overallNilai']);
        }
        $sheet->setCellValue('D'.$tRow, $this->data['overallCategory'] ?? '');
        $sheet->getStyle("A{$tRow}:D{$tRow}")->getFont()->setBold(true);
        $this->applyBorders($sheet, "A{$tRow}:D{$tRow}");
        $sheet->getStyle("A{$tRow}:D{$tRow}")->getFill()
            ->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('FFEEF2FF');

        // Column dimensions & number format
        $sheet->getColumnDimension('A')->setWidth(40);
        $sheet->getColumnDimension('B')->setWidth(12);
        $sheet->getColumnDimension('C')->setWidth(10);
        $sheet->getColumnDimension('D')->setWidth(32);
        $sheet->getStyle('B'.($hRow + 1).':B'.$tRow)->getNumberFormat()->setFormatCode('0.00');
        $sheet->getStyle('B'.($hRow + 1).':B'.$tRow)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $sheet->getStyle('C'.($hRow + 1).':C'.$tRow)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

        // Bar chart — skor per domain
        $chart = $this->makeBarChart(
            'domainScoreChart', 'Skor Maturitas per Domain (1–5)',
            $sheet->getTitle(), $hRow + 1, $tRow - 1, 'A', 'B',
            'A'.($tRow + 2), 'H'.($tRow + 18),
        );
        $valSeries = $chart->getPlotArea()->getPlotGroup()[0]->getPlotValues()[0];
        $valSeries->setFillColor(self::DOMAIN_PALETTE);
        $sheet->addChart($chart);
    }

    // ── Sheet 2: Hasil per Kontrol (8 domain charts) ──────────────

    private function buildDomainChartsSheet(Spreadsheet $spreadsheet): void
    {
        $sheet = $spreadsheet->createSheet();
        $sheet->setTitle('Hasil per Kontrol');

        $period = $this->data['period'];
        $domainCharts = $this->data['domainCharts'];

        $sheet->setCellValue('A1', 'Hasil Penilaian Maturitas per Kontrol — '.$period->name.' ('.$period->year.')');
        $sheet->mergeCells('A1:K1');
        $sheet->getStyle('A1')->getFont()->setBold(true)->setSize(13);

        $sheet->getColumnDimension('A')->setWidth(14);
        $sheet->getColumnDimension('B')->setWidth(8);

        $row = 3;

        foreach ($domainCharts as $i => $dc) {
            $color = $dc['color'];
            $count = count($dc['labels']);

            // Domain section title
            $sheet->setCellValue('A'.$row, $dc['code'].'. '.$dc['name']);
            $sheet->mergeCells('A'.$row.':B'.$row);
            $sheet->getStyle('A'.$row)->getFont()->setBold(true)->setSize(11);
            $sheet->getStyle('A'.$row.':B'.$row)->getFill()
                ->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB('FF'.strtoupper($color));
            $sheet->getStyle('A'.$row)->getFont()->getColor()->setARGB('FFFFFFFF');
            $row++;

            // Data header
            $sheet->setCellValue('A'.$row, 'Kode Kontrol');
            $sheet->setCellValue('B'.$row, 'Nilai');
            $this->applyHeaderStyle($sheet, "A{$row}:B{$row}");
            $hRow = $row;
            $row++;

            // Data rows
            $firstDataRow = $row;
            foreach ($dc['labels'] as $j => $label) {
                $val = $dc['data'][$j];
                $sheet->setCellValue('A'.$row, $label);
                $sheet->setCellValue('B'.$row, $val);
                $this->applyBorders($sheet, "A{$row}:B{$row}");
                $sheet->getStyle('B'.$row)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
                if ($val > 0) {
                    $this->colorNilai($sheet, 'B'.$row, $val);
                }
                $row++;
            }
            $lastDataRow = $row - 1;

            // Bar chart positioned to the right of the data table
            $chartHeight = max($count + 2, 12);
            $chart = $this->makeBarChart(
                'domChart'.$i, $dc['code'].'. '.$dc['name'].' — Nilai per Kontrol (1–5)',
                $sheet->getTitle(), $firstDataRow, $lastDataRow, 'A', 'B',
                'D'.$hRow, 'K'.($hRow + $chartHeight),
                $color,
            );
            $sheet->addChart($chart);

            $row += 2; // gap before next domain
        }
    }

    // ── Sheet 3: Detail Kontrol ────────────────────────────────────

    private function buildDetailSheet(Spreadsheet $spreadsheet): void
    {
        $sheet = $spreadsheet->createSheet();
        $sheet->setTitle('Detail Kontrol');

        $period = $this->data['period'];

        $sheet->setCellValue('A1', 'Detail Penilaian per Kontrol — '.$period->name.' ('.$period->year.')');
        $sheet->mergeCells('A1:G1');
        $sheet->getStyle('A1')->getFont()->setBold(true)->setSize(13);

        $hRow = 3;
        foreach (['Kode', 'Domain', 'Sub-domain', 'Kontrol', 'Persentase (%)', 'Nilai', 'Kategori'] as $i => $h) {
            $sheet->setCellValue(chr(65 + $i).$hRow, $h);
        }
        $this->applyHeaderStyle($sheet, "A{$hRow}:G{$hRow}");

        $row = $hRow + 1;
        foreach ($this->data['rows'] as $r) {
            $sheet->setCellValue('A'.$row, $r['code']);
            $sheet->setCellValue('B'.$row, $r['domain']);
            $sheet->setCellValue('C'.$row, $r['subdomain']);
            $sheet->setCellValue('D'.$row, $r['title']);
            if ($r['percentage'] !== null) {
                $sheet->setCellValue('E'.$row, (float) $r['percentage']);
            }
            if ($r['nilai'] !== null) {
                $sheet->setCellValue('F'.$row, (int) $r['nilai']);
                $this->colorNilai($sheet, 'F'.$row, (int) $r['nilai']);
            }
            $sheet->setCellValue('G'.$row, $r['category'] ?? '');
            $this->applyBorders($sheet, "A{$row}:G{$row}");
            $row++;
        }

        $lastRow = $row - 1;

        $sheet->getColumnDimension('A')->setWidth(10);
        $sheet->getColumnDimension('B')->setWidth(30);
        $sheet->getColumnDimension('C')->setWidth(20);
        $sheet->getColumnDimension('D')->setWidth(50);
        $sheet->getColumnDimension('E')->setWidth(15);
        $sheet->getColumnDimension('F')->setWidth(8);
        $sheet->getColumnDimension('G')->setWidth(30);

        $sheet->getStyle("E".($hRow + 1).":E{$lastRow}")->getNumberFormat()->setFormatCode('0.00');
        $sheet->getStyle("E".($hRow + 1).":E{$lastRow}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $sheet->getStyle("F".($hRow + 1).":F{$lastRow}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $sheet->getStyle("D".($hRow + 1).":D{$lastRow}")->getAlignment()->setWrapText(true);

        $sheet->freezePane('A'.($hRow + 1));
        $sheet->setAutoFilter("A{$hRow}:G{$lastRow}");
    }

    // ── Sheet 4: Review ────────────────────────────────────────────

    private function buildReviewSheet(Spreadsheet $spreadsheet): void
    {
        $sheet = $spreadsheet->createSheet();
        $sheet->setTitle('Review');

        $period = $this->data['period'];

        $sheet->setCellValue('A1', 'Status Review per Kontrol — '.$period->name.' ('.$period->year.')');
        $sheet->mergeCells('A1:F1');
        $sheet->getStyle('A1')->getFont()->setBold(true)->setSize(13);

        $hRow = 3;
        foreach (['Kode', 'Kontrol', 'Domain', 'Status Review', 'Reviewer', 'Tanggal Review'] as $i => $h) {
            $sheet->setCellValue(chr(65 + $i).$hRow, $h);
        }
        $this->applyHeaderStyle($sheet, "A{$hRow}:F{$hRow}");

        $row = $hRow + 1;
        foreach ($this->data['reviewRows'] as $r) {
            $sheet->setCellValue('A'.$row, $r['code']);
            $sheet->setCellValue('B'.$row, $r['title']);
            $sheet->setCellValue('C'.$row, $r['domain']);
            $sheet->setCellValue('D'.$row, $r['status']);
            $sheet->setCellValue('E'.$row, $r['reviewer']);
            $sheet->setCellValue('F'.$row, $r['reviewed_at']);
            $this->applyBorders($sheet, "A{$row}:F{$row}");

            $color = self::STATUS_COLORS[$r['status']] ?? 'FFF3F4F6';
            $sheet->getStyle('D'.$row)->getFill()
                ->setFillType(Fill::FILL_SOLID)->getStartColor()->setARGB($color);

            $row++;
        }

        $lastRow = $row - 1;

        $sheet->getColumnDimension('A')->setWidth(10);
        $sheet->getColumnDimension('B')->setWidth(50);
        $sheet->getColumnDimension('C')->setWidth(30);
        $sheet->getColumnDimension('D')->setWidth(18);
        $sheet->getColumnDimension('E')->setWidth(22);
        $sheet->getColumnDimension('F')->setWidth(20);

        $sheet->getStyle("B".($hRow + 1).":B{$lastRow}")->getAlignment()->setWrapText(true);

        $sheet->freezePane('A'.($hRow + 1));
        $sheet->setAutoFilter("A{$hRow}:F{$lastRow}");
    }
}
