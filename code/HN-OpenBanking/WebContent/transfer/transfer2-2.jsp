<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

				<section id=ajaxTest02>
					<h3 id="elements">2단계 : 입금 계좌 입력</h3>
					<p>입금하실 계좌 정보를 선택해주세요</p>


					<hr class="major" />
					
					
					

						<div class="row">
							<div class="col-4 col-12-medium">

								<div class="col-12">
									<h4>은행 선택</h4>
								</div>
								<div class="col-12-small">
									<select name="bank_code" id="bank_code">
										<c:forEach items="${bList }" var="bank">
											<option value="${bank.code }">${bank.name }</option>
										</c:forEach>
									</select>
								</div>

							</div>
							<div class="col-8 col-12-medium">
								<div class="col-12">
									<h4>계좌 번호 입력</h4>
								</div>

								<div class="col-12">
									<input type="text" name="account_num" id="account_num" value=""
										placeholder="상대방 계좌번호를 입력하세요(하이픈 포함)" />
								</div>


								<br>

								<div class="col-12">
									<h4>이체할 금액</h4>
								</div>
								<div class="col-12">
									<input type="text" name="amount" id="amount" value=""
										placeholder="이체할 금액을 입력하세요." />
								</div>


							</div>


							<!-- Break -->
							<div class="col-12" style="text-align: right; margin-top: 2em">
								<input type="button" value="다음" class="button primary large" onclick="nextStep_02()"
								 id="secondStepBtn"/>
							</div>
						</div>
				</section>

