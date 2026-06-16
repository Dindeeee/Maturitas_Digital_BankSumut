import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Figtree', ...defaultTheme.fontFamily.sans],
            },
            colors: {
                // Oranye — warna brand UTAMA Bank Sumut (dominan: navbar, tombol, highlight)
                primary: {
                    50:  '#fff6ed',
                    100: '#ffead5',
                    200: '#fed7aa',
                    300: '#fdba74',
                    400: '#fb913c',
                    500: '#f58220', // oranye brand
                    600: '#e1690a',
                    700: '#bb4f0c',
                    800: '#943f12',
                    900: '#783512',
                    DEFAULT: '#f58220',
                },
                // Biru — warna brand SEKUNDER Bank Sumut (profesional: aksen, badge, link)
                accent: {
                    50:  '#e8f1fb',
                    100: '#c6dcf5',
                    200: '#93bdeb',
                    300: '#5e9bdf',
                    400: '#2f7ace',
                    500: '#00529c', // biru brand
                    600: '#024584',
                    700: '#04386b',
                    800: '#062f57',
                    900: '#07294a',
                    DEFAULT: '#00529c',
                },
                // Alias eksplisit untuk biru (sama dengan accent) bila perlu penamaan jelas
                secondary: {
                    50:  '#e8f1fb',
                    100: '#c6dcf5',
                    200: '#93bdeb',
                    300: '#5e9bdf',
                    400: '#2f7ace',
                    500: '#00529c',
                    600: '#024584',
                    700: '#04386b',
                    800: '#062f57',
                    900: '#07294a',
                    DEFAULT: '#00529c',
                },
            },
        },
    },

    plugins: [forms],
};
