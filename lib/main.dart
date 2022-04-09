import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_ui/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderPage(),
    );
  }
}

class OrderPage extends StatefulWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final List<String> options = [
    "Pro",
    "TakeAway",
    "Great Offers",
    "Rating 4.0+",
    "New Arrival",
    "Max Safety",
    "Fastest Delivery"
  ];

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              header(size),
              searchBar(size),
              SizedBox(
                height: 10,
              ),
              optionAvailable(),
              banner(),
              heading("Eat what makes you happy"),
              itemsGrid(),
              heading("Recommended For You"),
              recommendSection(),
              heading("965 restuarants around you"),
              restrntsAvailable(size)
            ],
          ),
        ),
      ),
    );
  }

  Widget item(String imgVal, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: Image.asset(
              imgVal,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(name),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget itemsGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            childAspectRatio: 1,
            children: [
              item("momos.jpg", "Momos"),
              item("pizza.jpg", "Pizza"),
              item("burger.jpg", "Burger"),
              item("chicken.jpg", "Chicken"),
              item("biryani.jpg", "Biryani"),
              item("pasta.jpg", "Pasta"),
              item("healthy.jpg", "Healthy"),
              item("fries.jpg", "Fries"),
              if (showAll) ...[
                item("momos.jpg", "Momos"),
                item("pizza.jpg", "Pizza"),
                item("burger.jpg", "Burger"),
                item("chicken.jpg", "Chicken"),
                item("biryani.jpg", "Biryani"),
                item("pasta.jpg", "Pasta"),
                item("healthy.jpg", "Healthy"),
                item("fries.jpg", "Fries"),
              ]
            ],
          ),
          if (!showAll)
            OutlinedButton(
              onPressed: () {
                setState(() {
                  showAll = true;
                });
              },
              child: Container(
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    "See More",
                    style: TextStyle(color: Colors.grey),
                  ))),
            )
        ],
      ),
    );
  }

  Widget heading(String text) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget restrntsCard(Size size, String heading, String subheading,
      String trailing, String imgVal) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      shadowColor: Colors.grey,
      child: Wrap(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.asset(
              imgVal,
              height: 170,
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 6.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "4.4",
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  trailing,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            title: Text(
              heading,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Container(child: Text(subheading)),
          )
        ],
      ),
    );
  }

  Widget restrntsAvailable(Size size) {
    return Column(
      children: <Widget>[
        restrntsCard(size, "Her Highness", "North Indian ,Kashmiri ,Chinese",
            "Rs350 for one", "northindian.jpeg"),
        restrntsCard(size, "Cookie Man", "Desserts ,Ice Cream,Bakery",
            "Rs250 for two", "cookie.jpg"),
        restrntsCard(size, "Best Belgian Waffle", "Waffle , Desserts,Beverages",
            "Rs150 for one", "waffle.jpg")
      ],
    );
  }

  Widget optionAvailable() {
    return Container(
      height: 30,
      margin: EdgeInsets.all(5.0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (context, int index) {
          return ActionChip(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(width: 1, color: Colors.grey),
            ),
            onPressed: () {},
            // padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            label: Text(options[index]),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }

  Container Cards(String imageVal, String heading, String subHeading) {
    return Container(
      height: 200,
      width: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Wrap(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                imageVal,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(
                heading,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Container(child: Text(subHeading)),
            )
          ],
        ),
      ),
    );
  }

  Widget recommendSection() {
    return Container(
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Cards(
              "McDonalds.png", "McDonald's", " Rs150 for one Burger,Fast Food"),
          SizedBox(
            height: 150,
            width: 10,
          ),
          Cards("barbequeue_Nation.jpg", "Barbeque Nation",
              "Rs1700 for two , Serves BBQ"),
          SizedBox(
            height: 150,
            width: 10,
          ),
          Cards("momos.jpg", "Momo's corner",
              "Rs300 for two Serves Momos,Beverages"),
          SizedBox(
            height: 150,
            width: 10,
          ),
          Cards("kfc.jpg", "KFC", "Rs400 for two Burger,Fast Food"),
        ],
      ),
    );
  }

  Widget banner() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(
              "banner.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget header(Size size) {
    return Container(
        height: 58,
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: FaIcon(
              FontAwesomeIcons.locationDot,
              color: kred,
            ),
          ),
          trailing: Icon(
            Icons.account_circle_outlined,
            color: kred,
            size: 30,
          ),
          title: Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold, color: kred),
            textAlign: TextAlign.left,
          ),
          subtitle:
              Container(child: Text("259/11,Hariganga Society,Yerawada,Pune")),
        ));
  }

  Widget searchBar(Size size) {
    return Container(
      // height: size.height / 17, //Try Percentage eg. size.height * 0.85
      width: size.width / 1.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 3,
          ),
          Expanded(
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(13),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Color(0xFFA1A1A1)),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: kred,
                    size: 25,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      size: 25,
                    ),
                    color: kred,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: "Restaurant name or a dish...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
