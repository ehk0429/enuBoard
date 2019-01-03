package org.ehk0429.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Page {

	private int num;
	private int amount;

	public Page() {
		this(1, 5);
	}

	public Page(int num, int amount) {
		this.num = num;
		this.amount = amount;
	}
}
