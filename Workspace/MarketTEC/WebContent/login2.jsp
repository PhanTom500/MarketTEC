<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class=''>
<head>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
<script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script src="js/codigos.js" type="text/javascript"></script>

<meta name="google-signin-client_id" content="553838659224-v4i0ehjeblhe4v10bh38cj52oi6ihnrd.apps.googleusercontent.com">
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="https://codepen.io/dpinnick/pen/LjdLmo?limit=all&page=21&q=service" />
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link rel="stylesheet" href="css/style.css"/>
	
<style class="cp-pen-styles">
@import
	url(https://fonts.googleapis.com/css?family=Raleway:400,100,200,300);
/* GENERAL RESETS */
* {
	margin: 0;
	padding: 0;
}

html {
	box-sizing: border-box;
}

*, *:before, *:after {
	margin: 0;
	padding: 0;
	box-sizing: inherit;
}

a {
	color: #666;
	text-decoration: none;
}

a:hover {
	color: #4FDA8C;
}

/* BODY */
body {
	position: relative;
	color: #666;
	font: 16px/26px "Raleway", sans-serif;
	text-align: center;
	height: 100%;
	background: -moz-linear-gradient(270deg, rgba(255, 255, 255, 1) 0%,
		rgba(81, 195, 184, 1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(34,
		46, 64, 1)), color-stop(100%, rgba(81, 195, 184, 1)));
	background: -webkit-linear-gradient(270deg, rgba(255, 255, 255, 1) 0%,
		rgba(81, 195, 184, 1) 100%);
	background: linear-gradient(180deg, rgba(255, 255, 255, 1) 0%,
		rgba(81, 195, 184, 1) 100%);
	overflow: hidden;
}

#user_login::placeholder {
	color: white;
}

#user_pass::placeholder {
	color: white;
}

#user_email::placeholder {
	color: white;
}

#user_name::placeholder {
	color: white;
}

.help-action {
	color: #FFFFFF;
}

.remenber-me {
	color: #FFFFFF;
}

.middles {
	width: 100%;
	text-align: center;
}

.btn {
	display: inline-block;
	width: 50px;
	height: 50px;
	background: #f1f1f1;
	margin: 10px;
	border-radius: 30%;
	box-shadow: 0 5px 15px -5px #00000070;
	color: #4FC1B7;
	overflow: hidden;
	position: relative;
}

.btn i {
	line-height: 40px;
	color: #4FC1B7;
	font-size: 26px;
	transition: 0.2s linear;
}

.btn:hover i {
	transform: scale(1.3);
	color: #f1f1f1;
}

.btn::before {
	content: "";
	position: absolute;
	width: 120%;
	height: 120%;
	background: #4FC1B7;
	transform: rotate(45deg);
	left: -110%;
	top: 90%;
}

.btn:hover::before {
	animation: aaa 0.7s 1;
	top: -10%;
	left: -10%;
}

@
keyframes aaa { 0%{
	left: -110%;
	top: 90%;
}

50%{
left

:

10%;
top

:

-30%;
}
100%{
top

:

-10%;
left

:

-10%;
}
}

/* BUTTON */
a.button {
	position: absolute;
	left: 20px;
	top: 20px;
	height: auto;
	padding: .8rem 1.0rem;
	font-size: .8rem;
	line-height: normal;
	text-transform: uppercase;
	font-family: 'Proxima Nova', sans-serif;
	font-weight: 700;
	letter-spacing: 0;
	border-radius: 0;
	border: 1px solid #2D515C;
	text-decoration: none;
	color: #fff;
	background-color: transparent;
	-webkit-transition: all .2s ease-in-out;
	-moz-transition: all .2s ease-in-out;
	-o-transition: all .2s ease-in-out;
	transition: all .2s ease-in-out;
}

a.button:hover {
	border-color: #2D515C;
	color: #fff;
	padding: 1.0rem 3.2rem;
}

@media only screen and (min-width: 22em) {
	a.button {
		padding: 1.0rem 2.8rem;
		font-size: 1.0rem;
	}
}

/* LOGIN */
.login {
	margin: 0;
	width: 100%;
	height: 100%;
	min-height: 100vh;
}

/* WRAP */
.wrap {
	position: static;
	margin: auto;
	width: 100%;
	height: auto;
	overflow: hidden;
}

.wrap:after {
	content: "";
	display: table;
	clear: both;
}

/* LOGO */
.logo {
	position: absolute;
	z-index: 2;
	top: 0;
	left: 0;
	width: 40px;
	height: 40px;
	background: #4FC1B7;
}

.logo img {
	position: absolute;
	margin: auto;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	width: 30px;
}

.logo a {
	width: 100%;
	height: 100%;
	display: block;
}

/* USER (FORM WRAPPER) */
.user {
	position: relative;
	z-index: 0;
	float: none;
	margin: 0 auto;
	padding-top: 40px;
	width: 100%;
	height: 100vh;
	overflow: auto;
	background: -moz-linear-gradient(48deg, rgba(128, 128, 128, 1) 0%,
		rgba(97, 107, 125, 1) 100%);
	background: -webkit-gradient(linear, left bottom, right top, color-stop(0%, rgba(42,
		46, 54, 1)), color-stop(100%, rgba(97, 107, 125, 1)));
	background: -webkit-linear-gradient(48deg, rgba(128, 128, 128, 1) 0%,
		rgba(97, 107, 125, 1) 100%);
	background: linear-gradient(42deg, rgba(128, 128, 128, 1) 0%,
		rgba(97, 107, 125, 1) 100%);
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-radius: 0;
	border-top: 1px solid #4FC1B7;
}

.user .actions {
	margin: 1em 0 0;
	padding-right: 10px;
	width: 100%;
	display: block;
	text-align: center;
}

.user .actions a {
	margin: 1em 0;
	width: 90px;
	display: inline-block;
	padding: .2em 0em;
	background-color: #5C6576;
	border: none;
	color: #999;
	cursor: pointer;
	text-align: center;
	font-size: .8em;
	border-radius: 30px 0 0 30px;
	-webkit-box-shadow: 0px 0px 27px -9px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: 0px 0px 27px -9px rgba(0, 0, 0, 0.75);
	box-shadow: 0px 0px 27px -9px rgba(0, 0, 0, 0.75);
}

.user .actions a:last-child {
	color: #fff;
	border-radius: 0 30px 30px 0;
	background-color: #28A55F;
	background: -moz-linear-gradient(270deg, rgba(105, 221, 201, 1) 0%,
		rgba(78, 193, 182, 1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(105,
		221, 201, 1)), color-stop(100%, rgba(78, 193, 182, 1)));
	background: -webkit-linear-gradient(270deg, rgba(105, 221, 201, 1) 0%,
		rgba(78, 193, 182, 1) 100%);
	background: linear-gradient(180deg, rgba(105, 221, 201, 1) 0%,
		rgba(78, 193, 182, 1) 100%);
}

/* TERMS */
@
keyframes show_terms { 0% {
	opacity: 0;
	-webkit-transform: translateY(-110%);
	-moz-transform: translateY(-110%);
	-o-transform: translateY(-110%);
	transform: translateY(-110%);
}

100%
{
opacity

:

1;
-webkit-transform

:

translateY

(0);
-moz-transform

:

translateY

(0);
-o-transform

:

translateY

(0);
transform

:

translateY

(0);
}
}
@
keyframes hide_terms { 0% {
	-webkit-transform: translateY(0);
	-moz-transform: translateY(0);
	-o-transform: translateY(0);
	transform: translateY(0);
	opacity: 1;
}

100%
{
-webkit-transform

:

translateY

(-110%);
-moz-transform

:

translateY

(-110%);
-o-transform

:

translateY

(-110%);
transform

:

translateY

(-110%);
opacity

:

0;
}
}
.terms, .recovery {
	position: absolute;
	z-index: 3;
	margin: 40px 0 0;
	padding: 1.5em 1em;
	width: 100%;
	height: calc(100% - 40px);
	border-radius: 0;
	background: #fff;
	text-align: left;
	overflow: auto;
	will-change: transform;
	-webkit-transform: translateY(-110%);
	-moz-transform: translateY(-110%);
	-o-transform: translateY(-110%);
	transform: translateY(-110%);
	opacity: 0;
	border-radius: 0;
}

.terms.open, .recovery.open {
	-webkit-transform: translateY(0);
	-moz-transform: translateY(0);
	-o-transform: translateY(0);
	transform: translateY(0);
	animation: show_terms .5s .2s 1 ease normal forwards;
}

.terms.closed, .recovery.closed {
	-webkit-transform: translateY(0);
	-moz-transform: translateY(0);
	-o-transform: translateY(0);
	transform: translateY(0);
	opacity: 1;
	animation: hide_terms .6s .2s 1 ease normal forwards;
}

.terms p, .recovery p {
	margin: 1em 0;
	font-size: .9em;
}

.terms h3, .recovery h3 {
	margin: 2em 0 .2em;
}

.terms p.small {
	margin: 0 0 1.5em;
	font-size: .8em;
}

.recovery form .input {
	margin: 0 0 .8em 0;
	padding: .8em 2em 10px 0;
	width: 100%;
	display: inline-block;
	background: transparent;
	border: 0;
	border-bottom: 1px solid #5A6374;
	outline: 0;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	color: inherit;
	font-family: inherit;
	color: #666;
}

.recovery form .button {
	margin: 1em 0;
	padding: .2em 3em;
	width: auto;
	display: block;
	background-color: #28A55F;
	border: none;
	color: #fff;
	cursor: pointer;
	font-size: .8em;
	border-radius: 0px;
	background: rgba(62, 181, 169, 1) 0%;
}

.form-wrap form .button:hover {
	background-color: #4FDA8C;
}

.recovery p.mssg {
	opacity: 0;
	-webkit-transition: opacity 1s .5s ease;
	-moz-transition: opacity 1s .5s ease;
	-o-transition: opacity 1s .5s ease;
	transition: opacity 1s .5s ease;
}

.recovery p.mssg.animate {
	opacity: 1;
}

/* CONTENT */
.content {
	position: fixed;
	z-index: 1;
	float: none;
	margin: 0 auto;
	width: 100%;
	height: 40px;
	background: -moz-linear-gradient(90deg, rgba(62, 181, 169, 1) 0%,
		rgba(111, 226, 204, 1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(111,
		226, 204, 1)), color-stop(100%, rgba(62, 181, 169, 1)));
	background: -webkit-linear-gradient(90deg, rgba(62, 181, 169, 1) 0%,
		rgba(111, 226, 204, 1) 100%);
	background: linear-gradient(0deg, rgba(62, 181, 169, 1) 0%,
		rgba(111, 226, 204, 1) 100%);
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	overflow: hidden;
}

/* TOGGLE */
#toggle-wrap {
	position: absolute;
	z-index: 4;
	top: 40px;
	right: 17px;
	width: 80px;
	height: 1px;
}

#toggle-terms span {
	background: #fff;
	border-radius: 0;
}
/* TOGGLE TERMS */
#toggle-terms {
	position: absolute;
	z-index: 4;
	right: 0;
	top: 0;
	width: 40px;
	height: 40px;
	margin: auto;
	display: block;
	cursor: pointer;
	background: rgba(0, 0, 0, 0.1);
	border-radius: 100%;
	opacity: 0;
	-webkit-transform: translate(-6px, 20px);
	-moz-transform: translate(-6px, 20px);
	-o-transform: translate(-6px, 20px);
	transform: translate(-6px, 20px);
}
/* CIRCLE EFFECT */
#toggle-terms:after {
	position: absolute;
	width: 100%;
	height: 100%;
	pointer-events: none;
	border-radius: 50%;
	content: '';
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}

#toggle-terms:before {
	speak: none;
	display: block;
	-webkit-font-smoothing: antialiased;
}

#toggle-terms {
	box-shadow: 0 0 0 0px rgba(0, 0, 0, 0.2);
	-webkit-transition: color 0.3s ease;
	-moz-transition: color 0.3s ease;
	-o-transition: color 0.3s ease;
	transition: color 0.3s ease;
}

#toggle-terms:after {
	top: 0px;
	left: 0px;
	padding: 0;
	z-index: -1;
	background: rgba(0, 0, 0, 0.2);
	-webkit-transition: -webkit-transform 0.2s, opacity 0.3s;
	-moz-transition: -moz-transform 0.2s, opacity 0.3s;
	-o-transition: -o-transform 0.2s, opacity 0.3s;
	transition: transform 0.2s, opacity 0.3s;
}

#toggle-terms.closed {
	color: rgba(0, 0, 0, 0.2);
}

#toggle-terms.closed:after {
	-webkit-transform: scale(1.6);
	-moz-transform: scale(1.6);
	-ms-transform: scale(1.6);
	transform: scale(1.6);
	opacity: 0;
}

/* CLOSE ANIMATION*/
@
keyframes show_close { 0% {
	opacity: 0;
	-webkit-transform: translate(-6px, -100px);
	-moz-transform: translate(-6px, -100px);
	-o-transform: translate(-6px, -100px);
	transform: translate(-6px, -100px);
}

100%
{
opacity


:


1;
-webkit-transform

:

translate

(-6
px
,
20
px

);
-moz-transform

:

translate

(-6
px
,
20
px

);
-o-transform

:

translate

(-6
px
,
20
px

);
transform

:

translate

(-6
px
,
20
px

);
}
}
@
keyframes hide_close { 0% {
	opacity: 1;
}

100%
{
opacity

:

0;
}
}
#toggle-terms.open {
	animation: show_close .4s .5s 1 ease normal forwards;
}

#toggle-terms.closed {
	animation: hide_close .2s .0s 1 ease normal forwards;
}

#toggle-terms:hover {
	background: rgba(0, 0, 0, 0.4);
}

/* TOGGLE TERMS CROSS */
#toggle-terms #cross {
	position: absolute;
	z-index: 4;
	height: 100%;
	width: 100%;
	-webkit-transform: rotate(0deg);
	-moz-transform: rotate(0deg);
	-o-transform: rotate(0deg);
	transform: rotate(0deg);
}

#toggle-terms.open #cross {
	-webkit-transition-delay: .9s;
	-moz-transition-delay: .9s;
	-o-transition-delay: .9s;
	transition-delay: .9s;
	-webkit-transition-duration: .2s;
	-moz-transition-duration: .2s;
	-o-transition-duration: .2s;
	transition-duration: .2s;
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	transform: rotate(45deg);
}

#toggle-terms.open #cross span {
	position: absolute;
	z-index: 4;
	-webkit-transition-delay: 0s;
	-moz-transition-delay: 0s;
	-o-transition-delay: 0s;
	transition-delay: 0s;
	-webkit-transition-duration: 0s;
	-moz-transition-duration: 0s;
	-o-transition-duration: 0s;
	transition-duration: 0s;
}

#toggle-terms.open #cross span:nth-child(1) {
	top: 15%;
	left: 19px;
	height: 70%;
	width: 1px;
}

#toggle-terms.open #cross span:nth-child(2) {
	left: 15%;
	top: 19px;
	width: 70%;
	height: 1px;
}

#toggle-terms #cross span:nth-child(1) {
	height: 0;
	-webkit-transition-delay: .625s;
	-moz-transition-delay: .625s;
	-o-transition-delay: .625s;
	transition-delay: .625s;
}

#toggle-terms #cross span:nth-child(2) {
	width: 0;
	-webkit-transition-delay: .375s;
	-moz-transition-delay: .375s;
	-o-transition-delay: .375s;
	transition-delay: .375s;
}

/* SLIDESHOW */
#slideshow {
	position: relative;
	margin: 0 auto;
	width: 100%;
	height: 100%;
	padding: 10px;
	border-radius: 10px 0 0 10px;
}

#slideshow h2 {
	margin: .0em auto .0em auto;
	text-align: center;
	font-size: 1.4em;
	color: #fff;
	line-height: .5em;
}

#slideshow p {
	color: #fff;
	display: none;
}

#slideshow div {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	padding: 1em 3em;
	background-repeat: no-repeat;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

#slideshow .one {
	background-image: url("image/dots.png");
	background-repeat: no-repeat;
	background-position: 0% 50%;
}

#slideshow .two {
	background-image: url("image/gears.png");
	background-repeat: no-repeat;
	background-position: 0% 50%;
}

#slideshow .three {
	background-image: url("image/splat.png");
	background-repeat: no-repeat;
	background-position: 0% 5%;
}

#slideshow .four {
	background-image: url("image/ray.png");
	background-repeat: no-repeat;
	background-position: 0% 50%;
}

/* FORM ELEMENTS */
input {
	font: 16px/26px "Raleway", sans-serif;
}

.form-wrap {
	width: 100%;
	margin: 2em auto 0;
}

.form-wrap a {
	color: #ccc;
	padding-bottom: 4px;
	border-bottom: 1px solid #5FD1C1;
}

.form-wrap a:hover {
	color: #fff;
}

.form-wrap .tabs {
	overflow: hidden;
}

.form-wrap .tabs * {
	-webkit-transition: .25s ease-in-out;
	-moz-transition: .25s ease-in-out;
	-o-transition: .25s ease-in-out;
	transition: .25s ease-in-out;
}

.form-wrap .tabs h3 {
	float: left;
	width: 50%;
}

.form-wrap .tabs h3 a {
	padding: 0.5em 0;
	text-align: center;
	font-weight: 400;
	display: block;
	color: #999;
	border: 0;
}

.form-wrap .tabs h3 a.active {
	color: #ccc;
}

.form-wrap .tabs h3 a.active span {
	padding-bottom: 4px;
	border-bottom: 1px solid #5FD1C1;
}

.form-wrap .tabs-content {
	padding: 1.5em 3em;
	text-align: left;
	width: auto;
}

.help-action {
	padding: .4em 0 0;
	font-size: .93em;
}

.form-wrap .tabs-content div[id$="tab-content"] {
	display: none;
}

.form-wrap .tabs-content .active {
	display: block !important;
}

.form-wrap form .input {
	margin: 0 0 .8em 0;
	padding: .8em 2em 10px 0;
	width: 100%;
	display: inline-block;
	background: transparent;
	border: 0;
	border-bottom: 1px solid #5A6374;
	outline: 0;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	color: inherit;
	font-family: inherit;
	color: #fff;
}

.form-wrap form .button {
	margin: 1em 0;
	padding: .2em 3em;
	width: auto;
	display: block;
	background-color: #28A55F;
	border: none;
	color: #fff;
	cursor: pointer;
	font-size: .8em;
	border-radius: 30px;
	background: -moz-linear-gradient(270deg, rgba(105, 221, 201, 1) 0%,
		rgba(78, 193, 182, 1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(105,
		221, 201, 1)), color-stop(100%, rgba(78, 193, 182, 1)));
	background: -webkit-linear-gradient(270deg, rgba(105, 221, 201, 1) 0%,
		rgba(78, 193, 182, 1) 100%);
	background: linear-gradient(180deg, rgba(105, 221, 201, 1) 0%,
		rgba(78, 193, 182, 1) 100%);
	-webkit-box-shadow: 0px 0px 37px -9px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: 0px 0px 37px -9px rgba(0, 0, 0, 0.75);
	box-shadow: 0px 0px 37px -9px rgba(0, 0, 0, 0.75);
}

.form-wrap form .button:hover {
	background-color: #4FDA8C;
}

.form-wrap form .checkbox {
	margin: 1em 0;
	padding: 20px;
	visibility: hidden;
	text-align: left;
}

.form-wrap form .checkbox:checked+label:after {
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
	filter: alpha(opacity = 100);
	opacity: 1;
}

.form-wrap form label[for] {
	position: relative;
	padding-left: 20px;
	cursor: pointer;
}

.form-wrap form label[for]:before {
	position: absolute;
	width: 17px;
	height: 17px;
	top: 0px;
	left: -14px;
	content: '';
	border: 1px solid #5A6374;
}

.form-wrap form label[for]:after {
	position: absolute;
	top: 1px;
	left: -10px;
	width: 15px;
	height: 8px;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
	filter: alpha(opacity = 0);
	opacity: 0;
	content: '';
	background-color: transparent;
	border: solid #67DAC6;
	border-width: 0 0 3px 3px;
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

.form-wrap .help-text {
	margin-top: .6em;
}

.form-wrap .help-text p {
	text-align: left;
	font-size: 14px;
}

.fa {
	display: none;
}
/* MEDIUM VIEWPORT */
@media only screen and (min-width: 40em) {
	/* GLOBAL TRANSITION */
	* {
		/*transition: .25s ease-in-out;*/
		
	}
	/* WRAP */
	.wrap {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		width: 600px;
		height: 500px;
		margin: auto;
		border-radius: 10px;
	}
	/* LOGO */
	.logo {
		top: 10px;
		left: 10px;
		width: 40px;
		height: 40px;
		background: none;
	}
	.logo img {
		width: 100%;
	}
	@
	keyframes show_close { 0% {
		opacity: 0;
		-webkit-transform: translate(-6px, -100px);
		-moz-transform: translate(-6px, -100px);
		-o-transform: translate(-6px, -100px);
		transform: translate(-6px, -100px);
	}
	100%
	{
	opacity	:	1;
	-webkit-transform	:	translate
	
	
	(-6
	px
	,
	18
	px
	
	
	
	);
	-moz-transform
	
	
	:
	
	
	
	translate
	
	
	
	(-6
	px
	,
	18
	px
	
	
	
	
	
	
	);
	-o-transform
	
	
	
	:
	
	
	
	translate
	
	
	(-6
	px
	,
	18
	px
	
	
	
	);
	transform
	
	
	
	:
	
	
	
	translate
	
	
	
	(-6
	px
	,
	18
	px
	
	
	
	);
}

}
/* TOGGLE WRAP */
#toggle-wrap {
	top: 60px;
	right: calc(50% + 17px);
	height: 80px;
	overflow: hidden;
}

#toggle-wrap.closed {
	width: 50%;
}
/* TOGGLE TERMS */
#toggle-terms {
	opacity: 1;
	-webkit-transform: translate(-6px, -100px);
	-moz-transform: translate(-6px, -100px);
	-o-transform: translate(-6px, -100px);
	transform: translate(-6px, -100px);
}

#toggle-terms.closed {
	opacity: 1;
	-webkit-transform: translate(-6px, 18px);
	-moz-transform: translate(-6px, 18px);
	-o-transform: translate(-6px, 18px);
	transform: translate(-6px, 18px);
}

/* SLIDESHOW */
#slideshow h2 {
	margin: 4.5em 0 1em;
	font-size: 2em;
}

#slideshow h2 span {
	padding: 5px 0;
	border: solid #B6EDE3;
	border-width: 1px 0;
}

#slideshow p {
	display: block;
}

#slideshow div {
	-webkit-background-size: auto;
	-moz-background-size: auto;
	-o-background-size: auto;
	background-size: auto;
}

#slideshow .one {
	background-position: 50% 130%;
}

#slideshow .two {
	background-position: 50% 200%;
}

#slideshow .three {
	background-position: 50% 300%;
}

#slideshow .four {
	background-position: -40% -80%;
}

/* CONTENT */
.content, .content.full {
	position: relative;
	float: left;
	width: 50%;
	height: 500px;
	-webkit-box-shadow: -3px 0px 45px -6px rgba(56, 75, 99, 0.61);
	-moz-box-shadow: -3px 0px 45px -6px rgba(56, 75, 99, 0.61);
	box-shadow: -3px 0px 45px -6px rgba(56, 75, 99, 0.61);
	border-radius: 10px 0 0 10px;
}
/* TERMS */
.terms, .recovery {
	position: absolute;
	width: 50%;
	height: 440px;
	float: left;
	margin: 60px 0 0;
	-webkit-box-shadow: -3px 0px 45px -6px rgba(56, 75, 99, 0.61);
	-moz-box-shadow: -3px 0px 45px -6px rgba(56, 75, 99, 0.61);
	box-shadow: -3px 0px 45px -6px rgba(56, 75, 99, 0.61);
	border-radius: 0 0 0 10px;
}
/* USER (FORM WRAPPER) */
.user {
	padding-top: 0;
	float: left;
	width: 50%;
	height: 500px;
	-webkit-box-shadow: -3px 0px 45px -6px rgba(56, 75, 99, 0.61);
	-moz-box-shadow: -3px 0px 45px -6px rgba(56, 75, 99, 0.61);
	box-shadow: -3px 0px 45px -6px rgba(56, 75, 99, 0.61);
	border-radius: 0 10px 10px 0;
	border: 0;
}

.user .actions {
	margin: 0;
	text-align: right;
}
/* FORM ELEMENTS */
.form-wrap {
	margin: 3em auto 0;
}

.form-wrap .tabs-content {
	padding: 1.5em 2.5em;
}

.tabs-content p {
	position: relative;
}
/* ARROW */
.tabs-content .fa {
	position: absolute;
	top: 8px;
	left: -16px;
	display: block;
	font-size: .8em;
	color: #fff;
	opacity: .3;
	-webkit-transform: translate(0, 0);
	-moz-transform: translate(0, 0);
	-o-transform: translate(0, 0);
	transform: translate(0, 0);
	-webkit-transition: transform .3s .3s ease, opacity .6s .0s ease;
	-moz-transition: transform .3s .3s ease, opacity .6s .0s ease;
	-o-transition: transform .3s .3s ease, opacity .6s .0s ease;
	transition: transform .3s .3s ease, opacity .6s .0s ease;
}

.tabs-content .fa.active {
	-webkit-transform: translate(-3px, 0);
	-moz-transform: translate(-3px, 0);
	-o-transform: translate(-3px, 0);
	transform: translate(-3px, 0);
	opacity: .8;
}

.tabs-content .fa.inactive {
	-webkit-transform: translate(0, 0);
	-moz-transform: translate(0, 0);
	-o-transform: translate(0, 0);
	transform: translate(0, 0);
	opacity: .3;
}

}
/* LARGE VIEWPORT */
@media only screen and (min-width: 60em) {
	/* WRAP */
	.wrap {
		width: 900px;
		height: 550px;
	}
	/* CONTENT */
	.content, .content.full {
		height: 550px;
	}
	.terms, .recovery {
		height: 490px;
	}
	/* SLIDESHOW */
	#slideshow h2 {
		margin: 4em 0 1em;
		font-size: 3em;
	}
	#slideshow .four {
		background-position: -82% -330%;
	}
	/* USER (FORM WRAPPER) */
	.user {
		height: 550px;
	}
	.form-wrap {
		margin: 5em auto 0;
	}
	.form-wrap .tabs-content {
		padding: 1.5em 4.9em;
	}
}

/* CSS */
.element {
	opacity: 0.0;
	transform: scale(0.95) translate3d(0, 100%, 0);
	transition: transform 400ms ease, opacity 400ms ease;
}

.element.active {
	opacity: 1.0;
	transform: scale(1.0) translate3d(0, 0, 0);
}

.element.inactive {
	opacity: 0.0;
	transform: scale(1) translate3d(0, 0, 0);
}
</style>
</head>
<body>
	<div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
	
	
	
	<script type="text/javascript">
		function onSignIn(googleUser) {
			alert('1');
			var profile = googleUser.getBasicProfile();
			alert('2');
			var id = profile.getId();
			alert('3');
			var name = profile.getName();
			alert('3');
			var email = profile.getEmail();

			window.location.href = 'success.jsp?id=' + id + '&name=' + name + '&email=' + email +' ';
			

		}
	</script>
</body>
</html>