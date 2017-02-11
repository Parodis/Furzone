var gulp = require('gulp');
var less = require('gulp-less');
var path = require('path');
var LessAutoprefix = require('less-plugin-autoprefix');
var autoprefix = new LessAutoprefix({ browsers: ['last 2 versions'] });
var watch = require('gulp-watch');
var plumber = require('gulp-plumber');
var browserSync = require('browser-sync');
var reload = browserSync.reload;
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

gulp.task('watch', function() {
    gulp.watch(['index.html', 'src/less/*.less']).on('change', function(evt) {
        browserSync.reload();
    });
});

gulp.task('default', ['watch', 'browserSync']);