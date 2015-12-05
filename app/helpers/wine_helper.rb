def find_wine
  @wine = Wine.find(params[:id])
end