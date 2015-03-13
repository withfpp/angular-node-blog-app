var gulp = require('gulp'),
    uglify = require('gulp-uglify'),
    sass = require('gulp-sass'),
    autoprefixer = require('gulp-autoprefixer'),
    minifycss = require('gulp-minify-css'),
    concat = require('gulp-concat'),
    rename = require('gulp-rename'),
    browserSync = require('browser-sync'),
    bower = require('gulp-bower'),
    jade = require('gulp-jade'),
    plumber = require('gulp-plumber'),
    clean = require('gulp-clean'),
    coffee = require('gulp-coffee');


var paths = {
  styles: ['app/**/*.scss', '!app/bower_components/**/*.scss'],
  js: ['app/**/*.js', 'app/modules/**/*.js',  '!app/bower_components/**/*.js'],
  views: ['app/**/*.jade'],
  img: ['app/img/*.jpg'],
  dest: 'dist',
  bower: 'app/bower_components'
};

gulp.task('scripts', function () {
  return gulp.src(paths.js)
    .pipe(plumber())
    // .pipe(coffee({bare:true}))
    .pipe(concat('app.js'))
    .pipe(gulp.dest(paths.dest + '/js'))
    .pipe(rename({suffix: '.min'}))
    .pipe(uglify())
    .pipe(gulp.dest(paths.dest + '/js'))
})

gulp.task('styles', function () {
  return gulp.src(paths.styles)
    .pipe(autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
    .pipe(plumber())
    .pipe(sass({style: 'expanded'}))
    .pipe(gulp.dest(paths.dest))
    .pipe(rename({suffix: '.min'}))
    .pipe(minifycss())
    .pipe(concat('styles.css'))
    .pipe(gulp.dest(paths.dest + '/css'))
})

gulp.task('views', function () {
  var LOCALS = {};
  return gulp.src(paths.views)
    .pipe(plumber())
    .pipe(jade({
      locals: LOCALS
    }))
    .pipe(jade({
      pretty: true
    }))
    .pipe(gulp.dest(paths.dest))
})

gulp.task('img', function(){
  return gulp.src(paths.img)
    .pipe(gulp.dest(paths.dest + '/img'))
})

gulp.task('watch', function () {
  gulp.watch(paths.js, ['scripts', browserSync.reload]);
  gulp.watch(paths.styles, ['styles', browserSync.reload]);
  gulp.watch(paths.views, ['views', browserSync.reload]);
});

gulp.task('bower', function () {
  return bower(paths.bower)
    .pipe(gulp.dest(paths.dest + '/bower_components'))
})

gulp.task('clean', function (){
  return gulp.src(paths.dest + '/js', {read: false})
    .pipe(clean());
})

gulp.task('browser-sync', function () {
  browserSync({
    server: {
      baseDir: paths.dest
    }
  });
});

gulp.task('init', ['styles', 'scripts', 'views', 'bower']);
gulp.task('dev', ['styles', 'scripts', 'views']);
gulp.task('rebuild', ['clean', 'init']);
gulp.task('default', ['clean', 'dev', 'browser-sync', 'watch']);
