package dao;

import java.util.ArrayList;
import dto.Food;

public class FoodRepository {
	
	private ArrayList<Food> listOfFoods = new ArrayList<Food>();
	
	private static FoodRepository instance = new FoodRepository();
	
	public static FoodRepository getInstance() {
		return instance;
	}
	
	public FoodRepository() {
		
		Food food1 = new Food("F1000", "엄마표 도시락", 7000);
		food1.setDescription("엄마표 도시락");
		food1.setCategory("한식");
		food1.setUnitsInStock(15);
		food1.setFilename("food00.jpg");
		
		Food food2 = new Food("F1001", "돈가스", 8500);
		food2.setDescription("돈가스");
		food2.setCategory("한식");
		food2.setUnitsInStock(20);
		food2.setFilename("food01.jpg");
		
		Food food3 = new Food("F1002", "초밥이랑 주먹밥이랑", 7000);
		food3.setDescription("초밥이랑 주먹밥이랑");
		food3.setCategory("한식");
		food3.setUnitsInStock(10);
		food3.setFilename("food02.jpg");
		
		listOfFoods.add(food1);
		listOfFoods.add(food2);
		listOfFoods.add(food3);
	}
	
	public ArrayList<Food> getAllFoods() {
		return listOfFoods;
	}
	
	public Food getProductById(String productId) {
		Food productById = null;
		
		for(int i=0; i < listOfFoods.size(); i++) {
			Food food = listOfFoods.get(i);
			
			if(food != null && food.getProductId() != null && 
					food.getProductId().equals(productId)) {
				productById = food;
				break;
			}
		}
		return productById;
	}
	
	public void addProduct(Food food) {
		listOfFoods.add(food);
	}
	
}
