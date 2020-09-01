[
    {name: 'Blue Bottle Seattle', x: 47.5809, y: -122.3160},
    {name: 'Blue Bottle SF', x: 37.5209, y: -122.3340},
    {name: 'Blue Bottle Moscow', x: 55.752047, y: 37.595242},
    {name: 'Blue Bottle Seattle2', x: 47.5869, y: -122.3368},
    {name: 'Blue Bottle Rio De Janeiro', x: -22.923489, y: -43.234418},
    {name: 'Blue Bottle Sydney', x: -33.871843, y: 151.206767}
].each do |shop|
  CoffeeShop.find_or_create_by(shop)
end
