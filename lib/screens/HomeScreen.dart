import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/constants/constants.dart';
import 'package:shareyourbook/model/contactModel.dart';
import 'package:shareyourbook/provider/booksProvider.dart';
import 'package:shareyourbook/provider/userProvider.dart';
import 'package:shareyourbook/screens/ContactScreen.dart';
import 'package:shareyourbook/widgets/title.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getAppUserFromDb();
    Provider.of<BooksProvider>(context, listen: false).getAllBooksFromDB();
  }

  @override
  Widget build(BuildContext context) {
    BooksProvider bookProvider = Provider.of<BooksProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenTitle(title: "Discover Books"),
            // search bar
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.only(
                left: 20,
              ),
              height: 47,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(23)),
                  color: Color(0xffF8FAFB)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 30,
                      color: Color(0xffA5B4CA),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "type here to search",
                      style: TextStyle(
                        color: Color(0xffA5B4CA),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.5,
                  ),
                  itemCount: bookProvider.books.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              bookProvider.books[index].image),
                                          fit: BoxFit.cover),
                                      border: Border.all(
                                        color: Color(0xffCF8400),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                Positioned(
                                  left: 5,
                                  top: 7,
                                  child: Container(
                                    height: 25,
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color:
                                            bookProvider.books[index].status ==
                                                    "available"
                                                ? Color(0xff00FF0A)
                                                : Color(0xffF85AA5)),
                                    child: Center(
                                      child: Text(
                                        bookProvider.books[index].status,
                                        style: TextStyle(
                                          color: bookProvider
                                                      .books[index].status ==
                                                  "available"
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 11,
                                  left: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        ContactScreen.id,
                                        arguments: ContactModel(
                                            name: bookProvider
                                                .books[index].ownerName,
                                            fblink: bookProvider
                                                .books[index].fblink,
                                            gmaillink: bookProvider
                                                .books[index].ownerId),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: Color(0xffF9C402),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                        child: Text(
                                          "Contact " +
                                              bookProvider
                                                  .books[index].ownerName,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: bookProvider.books[index].name + ', ',
                            style: kBookTitle,
                            children: <TextSpan>[
                              TextSpan(
                                  text: bookProvider.books[index].author,
                                  style: kBookStatus),
                            ],
                          ),
                        ),
                        Text(
                          bookProvider.books[index].location,
                          style: kBookStatus,
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
