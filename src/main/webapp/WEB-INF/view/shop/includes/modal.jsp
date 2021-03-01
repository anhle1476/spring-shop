<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!--  Modal -->
		<div class="modal fade" id="productView" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered"
				role="document">
				<div class="modal-content">
					<div class="modal-body p-0">
						<div class="row align-items-stretch">
							<div class="col-lg-6 p-lg-0">
								<a class="product-view d-block h-100 bg-cover bg-center"
									style="background: url(shop-resources/img/product-5.jpg)"
									href="#" id="modal-img"></a>
							</div>
							<div class="col-lg-6">
								<button class="close p-4" type="button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&#10005;</span>
								</button>
								<div class="p-5 my-md-4">
									<a href="#" class="h4" id="modal-name">name</a>
									<p class="text-muted" id="modal-price">price</p>
									<p class="text-small mb-4" id="modal-desc">desc</p>
								</div>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		