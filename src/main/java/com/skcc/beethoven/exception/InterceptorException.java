package com.skcc.beethoven.exception;

public class InterceptorException extends RuntimeException {

	private String code = "I1000";
	private String msg = "거래 전처리 중 오류가 발생했습니다.<br>오류가 지속적으로 발생 시 관리자에게 문의해 주세요.";
	
	public InterceptorException()
	{
		super();
	}
	
	public InterceptorException(String msg)
	{
		this.msg = msg;
	}
	
	public InterceptorException(String code, String msg)
	{
		this.code = code;
		this.msg = msg;
	}
	
	public String getCode()
	{
		return code;
	}
	
	public String getMsg()
	{
		return msg;
	}	
	
	public Exception getException()
	{
		return this;
	}
}
