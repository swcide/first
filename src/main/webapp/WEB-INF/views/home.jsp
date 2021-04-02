<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
<html>
<head>

	<title>Home</title>
</head>
<body >
	<c:import url="common/header.jsp"/>
		<section id="page-title">

			<div class="container clearfix">
				<h1>Blog</h1>
				<span>Our Latest News in Grid Layout</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Blog</li>
				</ol>
			</div>

		</section>
		
		
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">

					<!-- Posts
					============================================= -->
					<div id="posts" class="post-grid row grid-container gutter-30 has-init-isotope" data-layout="fitRows" style="position: relative; height: 1083.34px;">

						<div class="entry col-lg-3 col-md-4 col-sm-6 col-12" style="position: absolute; left: 0%; top: 0px;">
							<div class="grid-inner">
								<div class="entry-image">
									<a href="images/blog/full/17.jpg" data-lightbox="image"><img src="images/blog/grid/17.jpg" alt="Standard Post with Image"></a>
								</div>
								<div class="entry-title">
									<h2><a href="blog-single.html">This is a Standard post with a Preview Image</a></h2>
								</div>
								<div class="entry-meta">
									<ul>
										<li><i class="icon-calendar3"></i> 10th Feb 2021</li>
										<li><a href="blog-single.html#comments"><i class="icon-comments"></i> 13</a></li>
										<li><a href="#"><i class="icon-camera-retro"></i></a></li>
									</ul>
								</div>
								<div class="entry-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, voluptatem, dolorem animi nisi autem blanditiis enim culpa reiciendis et explicabo tenetur!</p>
									<a href="blog-single.html" class="more-link">Read More</a>
								</div>
							</div>
						</div>

						<div class="entry col-lg-3 col-md-4 col-sm-6 col-12" style="position: absolute; left: 25%; top: 0px;">
							<div class="grid-inner">
								<div class="entry-image">
									<div class="fluid-width-video-wrapper" style="padding-top: 56.2%;"><iframe src="https://player.vimeo.com/video/87701971" allow="autoplay; fullscreen" allowfullscreen="" id="fitvid0"></iframe></div>
								</div>
								<div class="entry-title">
									<h2><a href="blog-single-full.html">This is a Standard post with a Vimeo Video</a></h2>
								</div>
								<div class="entry-meta">
									<ul>
										<li><i class="icon-calendar3"></i> 16th Feb 2021</li>
										<li><a href="blog-single-full.html#comments"><i class="icon-comments"></i> 19</a></li>
										<li><a href="#"><i class="icon-film"></i></a></li>
									</ul>
								</div>
								<div class="entry-content">
									<p>Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem consectetur pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt!</p>
									<a href="blog-single-full.html" class="more-link">Read More</a>
								</div>
							</div>
						</div>

						<div class="entry col-lg-3 col-md-4 col-sm-6 col-12" style="position: absolute; left: 50%; top: 0px;">
							<div class="grid-inner">
								<div class="entry-image">
									<div class="fslider" data-arrows="false" data-lightbox="gallery">
										<div class="flexslider">
											
										<div class="flex-viewport" style="overflow: hidden; position: relative; height: 168px;"><div class="slider-wrap" style="width: 1000%; transition-duration: 0s; transform: translate3d(-300px, 0px, 0px);"><div class="slide clone" aria-hidden="true" style="width: 300px; margin-right: 0px; float: left; display: block;"><a href="images/blog/full/21.jpg" data-lightbox=""><img src="images/blog/grid/21.jpg" alt="Standard Post with Gallery" draggable="false"></a></div>
												<div class="slide flex-active-slide" style="width: 300px; margin-right: 0px; float: left; display: block;" data-thumb-alt=""><a href="images/blog/full/10.jpg" data-lightbox="gallery-item"><img src="images/blog/grid/10.jpg" alt="Standard Post with Gallery" draggable="false"></a></div>
												<div class="slide" data-thumb-alt="" style="width: 300px; margin-right: 0px; float: left; display: block;"><a href="images/blog/full/20.jpg" data-lightbox="gallery-item"><img src="images/blog/grid/20.jpg" alt="Standard Post with Gallery" draggable="false"></a></div>
												<div class="slide" data-thumb-alt="" style="width: 300px; margin-right: 0px; float: left; display: block;"><a href="images/blog/full/21.jpg" data-lightbox="gallery-item"><img src="images/blog/grid/21.jpg" alt="Standard Post with Gallery" draggable="false"></a></div>
											<div class="slide clone" style="width: 300px; margin-right: 0px; float: left; display: block;" aria-hidden="true"><a href="images/blog/full/10.jpg" data-lightbox=""><img src="images/blog/grid/10.jpg" alt="Standard Post with Gallery" draggable="false"></a></div></div></div><ol class="flex-control-nav flex-control-paging"><li><a href="#" class="flex-active">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li></ol></div>
									</div>
								</div>
								<div class="entry-title">
									<h2><a href="blog-single-small.html">This is a Standard post with a Slider Gallery</a></h2>
								</div>
								<div class="entry-meta">
									<ul>
										<li><i class="icon-calendar3"></i> 24th Feb 2021</li>
										<li><a href="blog-single-small.html#comments"><i class="icon-comments"></i> 21</a></li>
										<li><a href="#"><i class="icon-picture"></i></a></li>
									</ul>
								</div>
								<div class="entry-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, voluptatem, dolorem animi nisi autem blanditiis enim culpa reiciendis et explicabo tenetur!</p>
									<a href="blog-single-small.html" class="more-link">Read More</a>
								</div>
							</div>
						</div>

						<div class="entry col-lg-3 col-md-4 col-sm-6 col-12" style="position: absolute; left: 75%; top: 0px;">
							<div class="grid-inner">
								<div class="entry-image clearfix">
									<iframe src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/301161123&amp;auto_play=false&amp;hide_related=true&amp;visual=true"></iframe>
								</div>
								<div class="entry-title">
									<h2><a href="blog-single.html">This is an Embedded SoundCloud Post</a></h2>
								</div>
								<div class="entry-meta">
									<ul>
										<li><i class="icon-calendar3"></i> 28th Apr 2021</li>
										<li><a href="blog-single.html#comments"><i class="icon-comments"></i> 16</a></li>
										<li><a href="#"><i class="icon-music2"></i></a></li>
									</ul>
								</div>
								<div class="entry-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, voluptatem, dolorem animi nisi autem blanditiis enim culpa reiciendis et explicabo tenetur!</p>
									<a href="blog-single.html" class="more-link">Read More</a>
								</div>
							</div>
						</div>

						<div class="entry col-lg-3 col-md-4 col-sm-6 col-12" style="position: absolute; left: 0%; top: 541.594px;">
							<div class="grid-inner">
								<div class="entry-image">
									<div class="fluid-width-video-wrapper" style="padding-top: 56.25%;"><iframe src="https://www.youtube.com/embed/SZEflIVnhH8" allowfullscreen="" id="fitvid0"></iframe></div>
								</div>
								<div class="entry-title">
									<h2><a href="blog-single-full.html">This is a Standard post with a Youtube Video</a></h2>
								</div>
								<div class="entry-meta">
									<ul>
										<li><i class="icon-calendar3"></i> 30th Apr 2021</li>
										<li><a href="blog-single-full.html#comments"><i class="icon-comments"></i> 34</a></li>
										<li><a href="#"><i class="icon-film"></i></a></li>
									</ul>
								</div>
								<div class="entry-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, voluptatem, dolorem animi nisi autem blanditiis enim culpa reiciendis et explicabo tenetur!</p>
									<a href="blog-single-full.html" class="more-link">Read More</a>
								</div>
							</div>
						</div>

						<div class="entry col-lg-3 col-md-4 col-sm-6 col-12" style="position: absolute; left: 25%; top: 541.594px;">
							<div class="grid-inner">
								<div class="entry-image clearfix">
									<div class="fslider" data-animation="fade" data-pagi="false" data-lightbox="gallery">
										<div class="flexslider" style="height: 168px;">
											<div class="slider-wrap">
												<div class="slide flex-active-slide" style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 2;"><a href="images/blog/full/2.jpg" data-lightbox="gallery-item"><img src="images/blog/grid/2.jpg" alt="Standard Post with Gallery" draggable="false"></a></div>
												<div class="slide" style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1;"><a href="images/blog/full/3.jpg" data-lightbox="gallery-item"><img src="images/blog/grid/3.jpg" alt="Standard Post with Gallery" draggable="false"></a></div>
												<div class="slide" style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1;"><a href="images/blog/full/12.jpg" data-lightbox="gallery-item"><img src="images/blog/grid/12.jpg" alt="Standard Post with Gallery" draggable="false"></a></div>
												<div class="slide" style="width: 100%; float: left; margin-right: -100%; position: relative; opacity: 0; display: block; z-index: 1;"><a href="images/blog/full/13.jpg" data-lightbox="gallery-item"><img src="images/blog/grid/13.jpg" alt="Standard Post with Gallery" draggable="false"></a></div>
											</div>
										<ul class="flex-direction-nav"><li class="flex-nav-prev"><a class="flex-prev" href="#"><i class="icon-angle-left"></i></a></li><li class="flex-nav-next"><a class="flex-next" href="#"><i class="icon-angle-right"></i></a></li></ul></div>
									</div>
								</div>
								<div class="entry-title">
									<h2><a href="blog-single-thumbs.html">This is a Standard post with Fade Gallery</a></h2>
								</div>
								<div class="entry-meta">
									<ul>
										<li><i class="icon-calendar3"></i> 3rd Mar 2021</li>
										<li><a href="blog-single-thumbs.html#comments"><i class="icon-comments"></i> 21</a></li>
										<li><a href="#"><i class="icon-picture"></i></a></li>
									</ul>
								</div>
								<div class="entry-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, voluptatem, dolorem animi nisi autem blanditiis enim culpa reiciendis et explicabo tenetur!</p>
									<a href="blog-single-thumbs.html" class="more-link">Read More</a>
								</div>
							</div>
						</div>

						<div class="entry col-lg-3 col-md-4 col-sm-6 col-12" style="position: absolute; left: 50%; top: 541.594px;">
							<div class="grid-inner">
								<div class="entry-image">
									<a href="images/blog/full/1.jpg" data-lightbox="image"><img src="images/blog/grid/1.jpg" alt="Standard Post with Image"></a>
								</div>
								<div class="entry-title">
									<h2><a href="blog-single.html">This is a Standard post with another Preview Image</a></h2>
								</div>
								<div class="entry-meta">
									<ul>
										<li><i class="icon-calendar3"></i> 5th May 2021</li>
										<li><a href="blog-single.html#comments"><i class="icon-comments"></i> 6</a></li>
										<li><a href="#"><i class="icon-camera-retro"></i></a></li>
									</ul>
								</div>
								<div class="entry-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, voluptatem, dolorem animi nisi autem blanditiis enim culpa reiciendis et explicabo tenetur!</p>
									<a href="blog-single.html" class="more-link">Read More</a>
								</div>
							</div>
						</div>

						<div class="entry col-lg-3 col-md-4 col-sm-6 col-12" style="position: absolute; left: 75%; top: 541.594px;">
							<div class="grid-inner">
								<div class="entry-image">
									<div class="fluid-width-video-wrapper" style="padding-top: 56.25%;"><iframe src="https://www.dailymotion.com/embed/video/x18murk" allowfullscreen="" id="fitvid0"></iframe></div>
								</div>
								<div class="entry-title">
									<h2><a href="blog-single-full.html">This is a Standard post with a Dailymotion Video</a></h2>
								</div>
								<div class="entry-meta">
									<ul>
										<li><i class="icon-calendar3"></i> 11th May 2021</li>
										<li><a href="blog-single-full.html#comments"><i class="icon-comments"></i> 9</a></li>
										<li><a href="#"><i class="icon-film"></i></a></li>
									</ul>
								</div>
								<div class="entry-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, voluptatem, dolorem animi nisi autem blanditiis enim culpa reiciendis et explicabo tenetur!</p>
									<a href="blog-single-full.html" class="more-link">Read More</a>
								</div>
							</div>
						</div>

					</div><!-- #posts end -->

					<!-- Pagination
					============================================= -->
					<ul class="pagination mt-5 pagination-circle justify-content-center">
						<li class="page-item disabled"><a class="page-link" href="#"><i class="icon-angle-left"></i></a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#"><i class="icon-angle-right"></i></a></li>
					</ul>

				</div>
			</div>
		</section>

	<c:import url="common/footer.jsp" />
</body>
</html>
