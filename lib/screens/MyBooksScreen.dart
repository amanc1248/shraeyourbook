import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/constants/constants.dart';
import 'package:shareyourbook/provider/yourBooksProvider.dart';
import 'package:shareyourbook/screens/EditBookScreen.dart';

class MyBooksScreen extends StatefulWidget {
  static const String id = "MyBooksScreen";
  const MyBooksScreen({Key? key}) : super(key: key);

  @override
  _MyBooksScreenState createState() => _MyBooksScreenState();
}

class _MyBooksScreenState extends State<MyBooksScreen> {
  @override
  Widget build(BuildContext context) {
    YourBooksProvider yourBooksProvider =
        Provider.of<YourBooksProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Your Books"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 30),
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                childAspectRatio: 0.5,
              ),
              itemCount: yourBooksProvider.yourBooks.length,
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
                                      image: AssetImage(yourBooksProvider
                                          .yourBooks[index].image),
                                      fit: BoxFit.cover),
                                  border: Border.all(
                                    color: Color(0xffCF8400),
                                    width: 3,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                            Positioned(
                              left: 5,
                              top: 7,
                              child: Container(
                                height: 18,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: yourBooksProvider
                                                .yourBooks[index].status ==
                                            "Available"
                                        ? Color(0xff00FF0A)
                                        : Color(0xffF85AA5)),
                                child: Center(
                                  child: Text(
                                    yourBooksProvider.yourBooks[index].status,
                                    style: TextStyle(
                                        color: yourBooksProvider
                                                    .yourBooks[index].status ==
                                                "Available"
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, EditBookScreen.id);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 15),
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
                                        "EDIT ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
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
                        text: yourBooksProvider.yourBooks[index].name + ', ',
                        style: kBookTitle,
                        children: <TextSpan>[
                          TextSpan(
                              text: yourBooksProvider.yourBooks[index].author,
                              style: kBookStatus),
                        ],
                      ),
                    ),
                    Text(
                      yourBooksProvider.yourBooks[index].location,
                      style: kBookStatus,
                    ),
                  ],
                );
              }),
        ));
  }
}
