package model;

import java.util.ArrayList;

public class RandomIntsBean {

	private ArrayList<Integer> randomInts;
	
	public RandomIntsBean() {
		randomInts = new ArrayList<Integer>();
	}
	
	public ArrayList<Integer> getRandomInts() {
		return randomInts;
	}

	public void setRandomInts(ArrayList<Integer> randomInts) {
		this.randomInts = randomInts;
	}
	

	@Override
	public String toString() {
	
		StringBuilder sb = new StringBuilder();
		
		for (Integer integer : this.randomInts) {
			sb.append(integer);
			sb.append(" ");
		}
		
		return sb.toString();
	}
	
}
