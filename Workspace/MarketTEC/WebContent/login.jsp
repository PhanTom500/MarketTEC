<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class=''>
<head>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<!-- 
<script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
 -->
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

#Ruser_pass::placeholder {
	color: white;
}

#user_email::placeholder {
	color: white;
}

#Ruser_email::placeholder {
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
a#button{
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

a#button:hover {
	border-color: #2D515C;
	color: #fff;
	padding: 1.0rem 3.2rem;
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
@media only screen and (min-width: 22em) {
	a#button {
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

.recovery form #button {
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

.form-wrap form #button:hover {
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
	padding: .5em 2em 1px 0;
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

.form-wrap form #button {
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

.form-wrap form #button:hover {
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
	<!-- LOGIN MODULE -->
	<div class="login">
		<div class="wrap">
			<!-- TOGGLE -->
			<div id="toggle-wrap">
				<div id="toggle-terms">
					<div id="cross">
						<span></span> <span></span>
					</div>
				</div>
			</div>
			<!-- TERMS -->
			<div class="terms">
				<h2>Términos de Servicio</h2>
				<p class="small">Última Modificación: Noviembre 29, 2019</p>
				<h3>Bienvenido a MarketTEC</h3>
				<p>Al usar nuestros Servicios, usted acepta estos términos.
				Por favor, léalos detenidamente</p>
				<p>Nuestros servicios son muy diversos, por lo que a veces hay términos adicionales
					o pueden aplicarse requisitos del producto (incluidos los requisitos de edad).
					Términos adicionales estarán disponibles con los Servicios relevantes, y
					esos términos adicionales se convierten en parte de su acuerdo con nosotros si usted
					usa esos servicios.</p>
				<h3>Usando nuestros servicios</h3>
				<p>Debe seguir cualquier política que esté disponible dentro de los
					Servicios</p>
				<p>El uso de nuestros Servicios no le otorga la propiedad de ningún derecho 
					de propiedad intelectual sobre nuestros Servicios o el contenido al que accede. 
					No puede usar el contenido de nuestros Servicios a menos que obtenga
					permiso de su propietario o de otra manera están permitidos por la ley. 
					Estos términos no le otorgan el derecho de usar la marca o los logotipos 
					utilizados en nuestros Servicios. No elimine, oculte ni altere ningún aviso 
					legal que aparezca en nuestros Servicios o junto con ellos.</p>
				<p>En relación con su uso de los Servicios, podemos enviarle anuncios de servicio, 
					mensajes administrativos y otra información. Puede optar por no recibir algunas 
					de esas comunicaciones.</p>
				<h3>Tu cuenta de MarketTEC</h3>
				<p>Es posible que necesite una cuenta MarketTEC para utilizar algunos de nuestros 
					servicios. Puede crear su propia cuenta MarketTEC, o su cuenta MarketTEC puede 
					ser asignada por un administrador, como su empleador o institución educativa. 
					Si está utilizando una cuenta MarketTEC que le asignó un administrador, se pueden 
					aplicar términos diferentes o adicionales y su administrador podrá acceder o 
					deshabilitar su cuenta.</p>
				<p>Para proteger su cuenta MarketTEC, mantenga su contraseña confidencial. Usted es 
					responsable de la actividad que ocurre en la página a través de su cuenta MarketTEC. 
					Intente no reutilizar la contraseña de su cuenta MarketTEC en aplicaciones de terceros.</p>
				<h3>Privacidad y Protección de Copyright</h3>
				<p>Las políticas de privacidad de MarketTEC explican cómo tratamos sus datos personales y 
					cómo protegemos su privacidad cuando utiliza nuestros Servicios. Al usar nuestros 
					Servicios, usted acepta que MarketTEC puede usar dichos datos de acuerdo con 
					nuestras políticas de privacidad.</p>
				<p>Respondemos a las notificaciones de presuntas infracciones de los derechos 
					de autor y cancelamos las cuentas de los infractores reincidentes de acuerdo 
					con el proceso establecido en la Ley de Derechos de Autor del Milenio Digital de EE. UU.</p>
				<p>Proporcionamos información para ayudar a los titulares de derechos de autor a administrar 
					su propiedad intelectual en línea. Si cree que alguien está violando sus derechos de 
					autor y quiere notificarnos, puede encontrar información sobre cómo enviar avisos y 
					la política de MarketTECMobile sobre cómo responder a avisos en nuestro Centro de ayuda.</p>
				<h3>Modificando y Terminando nuestros Servicios</h3>
				<p>Estamos constantemente cambiando y mejorando nuestros Servicios. Podemos agregar o eliminar 
					funcionalidades o características, y podemos suspender o detener un Servicio por completo.</p>
				<p>Puedes dejar de usar nuestros Servicios en cualquier momento, aunque lamentamos 
					verte partir. MarketTEC también puede dejar de proporcionarle Servicios, o agregar 
					o crear nuevos límites a nuestros Servicios en cualquier momento.</p>
				<p>Creemos que usted es el propietario de sus datos y es importante preservar su acceso a 
					dichos datos. Si descontinuamos un Servicio, cuando sea razonablemente posible, le daremos 
					un aviso anticipado razonable y la oportunidad de obtener información de ese Servicio.</p>
				<h3>Nuestras garantías y renuncias</h3>
				<p>Proporcionamos nuestros Servicios utilizando un nivel comercialmente razonable 
					de habilidad y cuidado y esperamos que disfrute de usarlos. Pero hay ciertas 
					cosas que no prometemos sobre nuestros Servicios.</p>
				<p>Aparte de lo expresamente establecido en estos términos o términos adicionales, 
					ni MarketTEC ni sus proveedores o distribuidores hacen ninguna promesa específica 
					sobre los servicios. POR EJEMPLO, NO HACEMOS NINGÚN COMPROMISO SOBRE EL CONTENIDO 
					DENTRO DE LOS SERVICIOS, LAS FUNCIONES ESPECÍFICAS DE LOS SERVICIOS, O SU 
					CONFIABILIDAD, DISPONIBILIDAD O CAPACIDAD PARA CUMPLIR CON SUS NECESIDADES. 
					PROVEEMOS LOS SERVICIOS TAL CUAL.</p>
				<p>ALGUNAS JURISDICCIONES PROPORCIONAN CIERTAS GARANTÍAS, COMO LA GARANTÍA 
					IMPLÍCITA DE COMERCIABILIDAD, IDONEIDAD PARA UN PROPÓSITO PARTICULAR Y 
					NO INFRACCIÓN EN LA MEDIDA PERMITIDA POR LA LEY, EXCLUYEMOS TODAS LAS GARANTÍAS.</p>
				<h3>Responsabilidad por nuestros servicios</h3>
				<p>CUANDO LO PERMITA LA LEY, MarketTEC Y LOS PROVEEDORES Y DISTRIBUIDORES 
					MarketTECmobile, NO SERÁN RESPONSABLES DE LAS GANANCIAS, INGRESOS 
					O DATOS, PÉRDIDAS FINANCIERAS O DAÑOS INDIRECTOS, ESPECIALES, 
					CONSECUENTES, EJEMPLARES O PUNITIVOS.</p>
				<p>EN LA MEDIDA EN QUE LO PERMITA LA LEY, LA RESPONSABILIDAD TOTAL DE 
					MarketTECMobile, Y SUS PROVEEDORES Y DISTRIBUIDORES, POR CUALQUIER 
					RECLAMO BAJO ESTOS TÉRMINOS, INCLUYENDO CUALQUIER GARANTÍA IMPLÍCITA, 
					SE LIMITA A LA CANTIDAD QUE USTED PAGÓ PARA USAR LOS SERVICIOS (O, SI 
					ELEGIMOS , PARA SUMINISTRARLE LOS SERVICIOS DE NUEVO).</p>
				<p>EN TODOS LOS CASOS, MarketTEC, Y SUS PROVEEDORES Y DISTRIBUIDORES, 
					NO SERÁN RESPONSABLES DE NINGUNA PÉRDIDA O DAÑO QUE NO ES RAZONABLEMENTE PREVISIBLE.</p>
				<h3>Acerca de los términos</h3>
				<p>Podemos modificar estos términos o cualquier otro término adicional 
					que se aplique a un Servicio para, por ejemplo, reflejar cambios en 
					la ley o cambios en nuestros Servicios. Debes mirar los términos 
					regularmente. Bueno, publique un aviso de modificaciones a estos 
					términos en esta página. Publique un aviso de términos adicionales 
					modificados en el Servicio correspondiente. Los cambios no se aplicarán 
					retroactivamente y entrarán en vigencia a más tardar catorce días 
					después de su publicación. Sin embargo, los cambios que aborden 
					nuevas funciones para un Servicio o los cambios realizados por 
					razones legales serán efectivos de inmediato. Si no está de 
					acuerdo con los términos modificados para un Servicio, debe 
					suspender el uso de ese Servicio.</p>
				<p>Si no cumple con estos términos y no tomamos medidas de inmediato, 
					esto no significa que estamos renunciando a ningún derecho que 
					podamos tener (como tomar medidas en el futuro).</p>
				<p>Las leyes de California, EE. UU., Excluyendo las reglas de conflicto 
					de leyes de California, se aplicarán a cualquier disputa que surja 
					de estos términos o los Servicios o estén relacionados con ellos. 
					Todos los reclamos que surjan de estos términos o se relacionen con 
					estos o los Servicios se litigarán exclusivamente en los tribunales 
					federales o estatales del condado de Santa Clara, California, EE. UU., 
					Y usted acepta la jurisdicción personal de dichos tribunales.</p>
				<p>Para una mayor información de como contactar a los encargados de 
					MarketTEC visite la sección de contacto.</p>
			</div>

			<!-- RECOVERY -->
			<div class="recovery">
				<h2>Recuperar Contraseña</h2>
				<p>
					Ingrese el <strong>correo</strong> 
					de la cuenta y click en<strong>Recuperar</strong>
				</p>
				<p>Se le enviará un correo con pasos para recuperar su cuenta</p>
				<form class="recovery-form" action="" method="post">
					<input type="text" class="input" id="user_recover"
						placeholder="Ingrese correo"> <input
						type="submit" class="button" value="Recuperar">
				</form>
				<p class="mssg">Se le ha enviado un correo con las instrucciones de recuperación</p>
			</div>
			
			<form id="form_head_index" action="producto" class="header_search_form clearfix" method="post">
				<input type="hidden" name="metodo" value="pindex">
			</form>

			<!-- SLIDER -->
			<div class="content">
				<!-- LOGO -->
				<div class="logo">
					<a href="javascript:$('#form_head_index').submit();"><img src="image/logo.png" alt=""></a>
				</div>
				<!-- SLIDESHOW -->
				<div id="slideshow">
					<div class="one">
						<h2>
							<span>PROMOCIONES</span>
						</h2>
						<p>Registrate para poder adquirir cualquiera de nuestros productos</p>
					</div>
					<div class="two">
						<h2>
							<span>GARANTIA</span>
						</h2>
						<p>Disfruta de nuestros productos con una garantía de hasta 1 año!</p>
					</div>
					<div class="three">
						<h2>
							<span>EFICIENCIA</span>
						</h2>
						<p>Estamos para atender tus pedidos las 24 horas del día</p>
					</div>
					<div class="four">
						<h2>
							<span>COMPARTE</span>
						</h2>
						<p>Recomienda a tus amigos y familiares para hacer crecer a esta buena familia</p>
					</div>
				</div>
			</div>
			<!-- LOGIN FORM -->
			<div class="user">
				<!-- ACTIONS
                    <div class="actions">
                        <a class="help" href="#signup-tab-content">Sign Up</a><a class="faq" href="#login-tab-content">Login</a>
                    </div>
                    -->
				<div class="form-wrap">
					<!-- TABS -->
					<div class="tabs">
						<h3 class="login-tab">
							<a class="log-in active" href="#login-tab-content"><span>Iniciar Sesión<span></a>
						</h3>
						<h3 class="signup-tab">
							<a class="sign-up" href="#signup-tab-content"><span>Registrate</span></a>
						</h3>
					</div>
					<!-- TABS CONTENT -->
					<div class="tabs-content">
						<!-- TABS CONTENT LOGIN -->
						<div id="login-tab-content" class="active">
							<form class="login-form" action="usuario" method="post">
								<input type="hidden" name="metodo" value="login">
								<input type="text" class="input" id="user_login" name="correo" autocomplete="off" placeholder="Correo"> 
								<input type="password" class="input" id="user_pass" name="pass" autocomplete="off" placeholder="Contraseña"> 
								<input type="checkbox" class="checkbox" checked id="remember_me"> 
								<label class="remenber-me" for="remember_me">Recuérdame</label> 
								<input type="submit"  id="button" class="btn" value="Ingresar">


								<div class="middles">
									<a class="btn" href="">
										<i class="fab fa-facebook-f"></i>
										<fb:login-button  scope="public_profile,email" onlogin="checkLoginState();">
										</fb:login-button>
									</a>
									
									<a class="btn"  href=""> 
										<i class="fab fa-google">
										</i>
										<div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
										
									</a>
								</div>




							</form>

						</div>
						<!-- TABS CONTENT SIGNUP -->
						<div id="signup-tab-content">
							<form class="signup-form" accept-charset="UTF-8" action="usuario" method="post">
								<input type="hidden" name="metodo" value="registralogin" >
								<div class="panel-group" id="steps">
									<div class="form-group">
										<input type="text" class="input" id="user_name" name="nombres" autocomplete="off" placeholder="Nombres">
									</div>
									<div class="form-group">
										<input type="email" class="input" id="Ruser_email" name="correo" autocomplete="off" placeholder="Correo">
									</div>
									<div class="form-group"> 
										<input type="password" class="input" id="Ruser_pass" name="pass" autocomplete="off" placeholder="Contraseña">
									</div>
									<div class="form-group"> 
										<input type="submit" id="button" class="btn" value="Registrar">
									</div>
									
								</div>
							</form>
							<div class="help-action">
								<p>Al registrarte, aceptas nuestros</p>
								<p>
									<i class="fa fa-arrow-left" aria-hidden="true"></i><a
										class="agree" href="#">Términos de servicio</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	<script>
		/* LOGIN - MAIN.JS - dp 2017 */

		// LOGIN TABS
		$(function() {
			var tab = $('.tabs h3 a');
			tab.on('click', function(event) {
				event.preventDefault();
				tab.removeClass('active');
				$(this).addClass('active');
				tab_content = $(this).attr('href');
				$('div[id$="tab-content"]').removeClass('active');
				$(tab_content).addClass('active');
			});
		});

		// SLIDESHOW
		$(function() {
			$('#slideshow > div:gt(0)').hide();
			setInterval(function() {
				$('#slideshow > div:first').fadeOut(1000).next().fadeIn(1000)
						.end().appendTo('#slideshow');
			}, 3850);
		});

		// CUSTOM JQUERY FUNCTION FOR SWAPPING CLASSES
		(function($) {
			'use strict';
			$.fn.swapClass = function(remove, add) {
				this.removeClass(remove).addClass(add);
				return this;
			};
		}(jQuery));

		// SHOW/HIDE PANEL ROUTINE (needs better methods)
		// I'll optimize when time permits.
		$(function() {
			$('.agree,.forgot, #toggle-terms, .log-in, .sign-up')
					.on(
							'click',
							function(event) {
								event.preventDefault();
								var terms = $('.terms'), recovery = $('.recovery'), close = $('#toggle-terms'), arrow = $('.tabs-content .fa');
								if ($(this).hasClass('agree')
										|| $(this).hasClass('log-in')
										|| ($(this).is('#toggle-terms'))
										&& terms.hasClass('open')) {
									if (terms.hasClass('open')) {
										terms.swapClass('open', 'closed');
										close.swapClass('open', 'closed');
										arrow.swapClass('active', 'inactive');
									} else {
										if ($(this).hasClass('log-in')) {
											return;
										}
										terms.swapClass('closed', 'open')
												.scrollTop(0);
										close.swapClass('closed', 'open');
										arrow.swapClass('inactive', 'active');
									}
								} else if ($(this).hasClass('forgot')
										|| $(this).hasClass('sign-up')
										|| $(this).is('#toggle-terms')) {
									if (recovery.hasClass('open')) {
										recovery.swapClass('open', 'closed');
										close.swapClass('open', 'closed');
										arrow.swapClass('active', 'inactive');
									} else {
										if ($(this).hasClass('sign-up')) {
											return;
										}
										recovery.swapClass('closed', 'open');
										close.swapClass('closed', 'open');
										arrow.swapClass('inactive', 'active');
									}
								}
							});
		});

		// DISPLAY MSSG
		$(function() {
			$('.recovery .button').on('click', function(event) {
				event.preventDefault();
				$('.recovery .mssg').addClass('animate');
				setTimeout(function() {
					$('.recovery').swapClass('open', 'closed');
					$('#toggle-terms').swapClass('open', 'closed');
					$('.tabs-content .fa').swapClass('active', 'inactive');
					$('.recovery .mssg').removeClass('animate');
				}, 2500);
			});
		});

		// DISABLE SUBMIT FOR DEMO
		$(function() {
			$('.button').on('click', function(event) {
				$(this).stop();
				event.preventDefault();
				return false;
			});
		});
		//# sourceURL=pen.js
	</script>
	<script>
		// This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			console.log(response.authResponse.accessToken);
			alert(response.authResponse.accessToken);

			if (response.status === 'connected') {

				//window.location.href = 'Sign_in_Controller.jsp?access_token=' + response.authResponse.accessToken;
				
				window.location.href = 'completarDatosFB.jsp?access_token=' + response.authResponse.accessToken;

			} else {
				// The person is not logged into your app or we are unable to tell.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			}
		}

		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample
		// code below.
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '436093307250900',
				cookie : true, // enable cookies to allow the server to access 
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.8' // use graph api version 2.8
			});

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});

		};

		// Load the SDK asynchronously
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		// Here we run a very simple test of the Graph API after login is
		// successful.  See statusChangeCallback() for when this call is made.
	</script>
	
	
	
	<script type="text/javascript">
		function onSignIn(googleUser) {
			//alert('1');
			var profile = googleUser.getBasicProfile();
			//alert('2');
			var id = profile.getId();
			//alert('3');
			var name = profile.getName();
			//alert('3');
			var email = profile.getEmail();
			
			
			//setTimeout(function(){
			  //  console.log("Cargar completar datos GM");
			//}, 600000000000000000);
			
			window.location.href = 'completarDatosGM.jsp?id=' + id + '&name=' + name + '&email=' + email +' ';

			
			

		}
	</script>
	
	
	<script type="text/javascript">
		function validaFb() {

			window.location.href = 'index_gmail_log.jsp?id=' + id + '&name=' + name + '&email=' + email +' ';
			

		}
		
		function alertaRegistro() {
			alert('Registro Exitoso, ingrese al sistema');
			//window.location.href = 'index_gmail_log.jsp?id=' + id + '&name=' + name + '&email=' + email +' ';
			

		}
	</script>
</body>
</html>