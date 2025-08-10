package model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private final Map<String, Product> products = new HashMap<>();

    public void addProduct(String id, String name, double price) {
        products.put(id, new Product(id, name, price));
    }

    public void removeProduct(String id) {
        products.remove(id);
    }

    public Map<String, Product> getProducts() {
        return new HashMap<>(products);
    }

    public static class Product {
        private final String id;
        private final String name;
        private final double price;

        public Product(String id, String name, double price) {
            this.id = id;
            this.name = name;
            this.price = price;
        }

        // Getters
        public String getId() { return id; }
        public String getName() { return name; }
        public double getPrice() { return price; }
    }
}