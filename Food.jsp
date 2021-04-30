<% 
class Food{
    String name;
    int price;
    String imgSrc;
    String index;
    
    public Food(String index, String name, int price, String imgSrc){
        this.name = name;
        this.price = price;
        this.imgSrc = imgSrc;
        this.index = index;
    }

    public String getName (){
        return this.name;
    }

    public int getPrice (){
        return this.price;
    }

    public String getImgSrc (){
        return this.imgSrc;
    }

    public String getIndex (){
        return this.index;
    }

}

%>