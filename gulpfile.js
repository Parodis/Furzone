var gulp = require('gulp'),
    less = require('gulp-less'),
    path = require('path'),
    LessAutoprefix = require('less-plugin-autoprefix'),
    autoprefix = new LessAutoprefix({
        browsers: ['last 2 versions']
    }),
    watch = require('gulp-watch'),
    plumber = require('gulp-plumber'),
    browserSync = require('browser-sync'),
    imagemin = require('gulp-imagemin'),
    reload = browserSync.reload;
//var lr = require('tiny-lr');
//var server = lr();

gulp.task('browserSync', function() {
    browserSync({
        server: {
            baseDir: "./"
        },
        port: 8080,
        open: true,
        notify: false
    });
});

gulp.task('img', function() {
    return gulp.src(['src/img/*.{png,jpg,gif}'])
        .pipe(imagemin({

            optimizationLevel: 7,

            progressive: true

        }))
        .pipe(gulp.dest('dist/img'));
});

gulp.task('watch', function() {
    gulp.watch(['src/img/*.{png,jpg,gif}'], ['img']);
    gulp.watch(['index.html', 'src/less/*.less']).on('change', function(evt) {
        browserSync.reload();
    });
});

gulp.task('default', ['watch', 'browserSync', 'img']);
