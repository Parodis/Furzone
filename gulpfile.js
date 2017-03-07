"use strict";
let gulp = require('gulp'),
    less = require('gulp-less'),
    path = require('path'),
    notify = require('gulp-notify'),
    util = require('gulp-util'),
    cssmin = require('gulp-cssmin'),
    uglify = require('gulp-uglify'),
    sourcemaps = require('gulp-sourcemaps'),
    babel = require('gulp-babel'),
    LessAutoprefix = require('less-plugin-autoprefix'),
    autoprefix = new LessAutoprefix({
        browsers: ['last 2 versions']
    }),
    watch = require('gulp-watch'),
    plumber = require('gulp-plumber'),
    browserSync = require('browser-sync'),
    imagemin = require('gulp-imagemin'),
    reload = browserSync.reload,
    exec = require('child_process').exec,
    plumberErrorHandler = {
        errorHandler: notify.onError({
            title: 'Gulp',
            message: 'Error: <%= error.message %>'
        })
    },
    config = {
        production: !!util.env.production,
        srcDir: 'src/',
        distDir: 'dist/'
    }

gulp.task('runserver', function() {
    let proc = exec('python3 manage.py runserver')
})


gulp.task('browserSync', function() {
    browserSync({
        server: {
            baseDir: "./"
        },
        port: 8080,
        open: true,
        //  proxy: 'localhost:8000',
        notify: false
    });
});

gulp.task('production:styles', function() {
    return gulp.src('src/less/main.less')
        .pipe(sourcemaps.init())
        .pipe(plumber(plumberErrorHandler))
        .pipe(less({
            plugins: [autoprefix]
        }))
        .pipe(cssmin())
        .pipe(sourcemaps.write('.'))
        .pipe(gulp.dest('dist/css'));
});

gulp.task('scripts', function() {
    gulp.src('src/js/*.js')
        .pipe(plumber(plumberErrorHandler))
        .pipe(babel())
        .pipe(gulp.dest('dist/js'))
        .pipe(reload({
            stream: true
        }))
});

gulp.task('img', function() {
    return gulp.src(['src/img/*.{png,jpg,gif}'])
        .pipe(imagemin({
            optimizationLevel: 7,
            progressive: true

        }))
        .pipe(gulp.dest('dist/img'));
});

gulp.task('scripts', function() {
    gulp.src('src/js/*.js')
        .pipe(plumber(plumberErrorHandler))
        .pipe(babel())
        .pipe(gulp.dest('dist/js'))
        .pipe(reload({
            stream: true
        }))
});

gulp.task('watch', function() {
    gulp.watch(['src/img/*.{png,jpg,gif}'], ['img']);
    gulp.watch(['src/js/*.js'], ['scripts']);
    gulp.watch(['*.html', 'src/less/*.less']).on('change', function(evt) {
        browserSync.reload();
    });
});
if (config.production) {
    gulp.task('default', ['scripts', 'img', 'production:styles']);
} else
    gulp.task('default', ['scripts', 'img', 'production:styles', 'watch', 'browserSync']);
