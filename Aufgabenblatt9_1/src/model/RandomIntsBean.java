package model;

import java.util.ArrayList;
import java.util.Random;

public class RandomIntsBean {
	
	private Random random ;
	private ArrayList<Integer> randomIntsList;
	private int size = 10;
	
	// Konstruktor
	public RandomIntsBean() {
		this.random = new Random();
		this.randomIntsList = new ArrayList<Integer>();
	}
		
	
	private ArrayList<Integer> fillListWithRandomInts(){
		ArrayList<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < size; i++) {
			list.add(random.nextInt());
		}
		return list;
	}
	
	// ---- GETTER / SETTER ----
	public ArrayList<Integer> getRandomIntsList(){
		this.randomIntsList = fillListWithRandomInts();
		return this.randomIntsList;	
	}
	
	
}
