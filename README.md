# Info threader blog

a example ruby on rails blog for sharing info between colleagues

## Built With

- Ruby
- Rails
- RSpec


## Getting Started

To get a local copy up and running follow these simple example steps.

```
git clone https://github.com/JuanLPalacios/Info-threader-blog.git
```
Then
```
cd Info-threader-blog
bundle install
rails db:create
rails db:schema:load
rails db:seed
```
Make sure that the defaut user for sistem exist in postgres to avoid error `Fatal: Role '[user_name]' does not exist` 
```
sudo su - posgres
createuser -s -r [user_name]
logout
```
finally
```
rails s
```

## Unit Tests

To run al tests run

```
rspec --force-color --format documentation
```


## Author

👤 **Juan Luis Palacios**

- GitHub: [@JuanLPalacios](https://github.com/JuanLPalacios)
- Twitter: [@JuanLuisPalac20](https://twitter.com/twitterhandle)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/juan-luis-palacios-p%C3%A9rez-95b39a228/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./LICENSE) licensed.

