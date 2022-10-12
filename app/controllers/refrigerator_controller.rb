class RefrigeratorController < ApplicationController
  def index
    @itemInfo = ReadTables.get_info
  end

  def destroy
    DeleteItems.delete_items(params[:Type], params[:Item])
    redirect_to refrigerator_url
  end

  def genre
    @itemInfo = ReadTables.get_info
    @fish = @itemInfo.select{|x| x["Type"] == "魚類"}
    @meat = @itemInfo.select{|x| x["Type"] == "肉類" || x["Type"] == "肉"}
    @vege = @itemInfo.select{|x| x["Type"] == "野菜"}
    @fruit = @itemInfo.select{|x| x["Type"] == "果物"}
    @dairy = @itemInfo.select{|x| x["Type"] == "乳製品"}
    @tohu = @itemInfo.select{|x| x["Type"] == "豆腐加工品"}
    @spices = @itemInfo.select{|x| x["Type"] == "調味料"}
  end

  def recipe
    itemInfo = ReadTables.get_info
    count = itemInfo.count
    @itemName = []
    @recipe = []
    i = 0
    while (i < 9) && (i < count) do
      @itemName.push(itemInfo[i]["Item"])
      @recipe.push(SearchRecipe.search_recipe(itemInfo[i]["Item"]))
      i = i + 1
    end    

  end
end