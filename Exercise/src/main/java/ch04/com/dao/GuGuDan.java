package ch04.com.dao;

public class GuGuDan {
	public String process(int num) {
		StringBuffer str = new StringBuffer();
		for(int i=1; i<9; i++) {
			str.append(num + " * " + i + " = " + num*i + "<br>");
		}
		return str.toString();
	}
	public int process(int num, int i) {
		return num*i;
	}
}
