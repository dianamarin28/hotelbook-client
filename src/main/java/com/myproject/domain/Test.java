package com.myproject.domain;

import javax.persistence.*;

@Entity
public class Test
{
	@Column(nullable = false)
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer testId;

	@Column(nullable = false, length = 20)
	private String name;

	public Integer getTestId()
	{
		return testId;
	}

	public void setTestId(Integer testId)
	{
		this.testId = testId;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}
}
