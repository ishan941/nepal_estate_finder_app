import 'package:flutter/material.dart';

List<ItemDetails> data = [
  ItemDetails(title: "Chicken Pakauda", quantity: 10000, price: "10000"),
  ItemDetails(title: "Panir Pakauda", quantity: 1, price: "100"),
  ItemDetails(title: "Momo", quantity: 4, price: "200"),
  ItemDetails(title: "Chicken Chaumin", quantity: 2, price: "150"),
  ItemDetails(title: "Momo", quantity: 4, price: "200"),
  ItemDetails(title: "Chicken Chaumin", quantity: 2, price: "150"),
  ItemDetails(title: "Momo", quantity: 4, price: "200"),
  ItemDetails(title: "Chicken Chaumin", quantity: 2, price: "150"),
  ItemDetails(title: "Momo", quantity: 4, price: "200"),
  ItemDetails(title: "Chicken Chaumin", quantity: 2, price: "150"),
];
List<Billings> dataList = [
  Billings(title: "Sub Total", price: "1300"),
  Billings(title: "Discount", price: "100"),
  Billings(title: "Total", price: "1200"),
  Billings(title: "Paid", price: "1200"),
  Billings(title: "Amount Receivable", price: "0"),
];

class RestPage extends StatefulWidget {
  const RestPage({Key? key}) : super(key: key);

  @override
  State<RestPage> createState() => _RestPageState();
}

class _RestPageState extends State<RestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: const Color(0xff3b94c5),
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          title: const Center(child: Text("Order Detail")),
          actions: const [
            Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Stack(
          children: [
            Container(color: Colors.blue.shade100),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Text(
                                  "ord-wfeg",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "2023-12-27",
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 10),
                            child: Container(
                              height: 80,
                              width: 140,
                              color: const Color(0xfffee6c4),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Center(
                                    child: Text(
                                      "Rs",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "1200",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        "Item Details",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffd4a255),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) => Container(
                      color:
                          index.isEven ? const Color(0xfff1f5f4) : Colors.white,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Text(
                                  data[index].title!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Rs ${data[index].price!}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffd4a255),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "  X  ${data[index].quantity}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 35),
                            child: Center(
                              child: Text(
                                "Rs ${data[index].price}",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: dataList.length,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                dataList[index].title!,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: Text(
                                "Rs ${dataList[index].price}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: index == dataList.length - 2
                                      ? Colors.green
                                      : index == dataList.length - 1
                                          ? Colors.red
                                          : Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) => Container(
                      color:
                          index.isEven ? const Color(0xfff1f5f4) : Colors.white,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Text(
                                  data[index].title!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Rs ${data[index].price!}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xffd4a255),
                                        ),
                                      ),
                                      TextSpan(
                                        text: "  X  ${data[index].quantity}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 35),
                            child: Center(
                              child: Text(
                                "Rs ${data[index].price}",
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 100,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Customer Details"),
                          Row(
                            children: [
                              Text("Makalu Software"),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("9849689512")
                                ],
                              )
                            ],
                          ),
                          Text("info@makalusoftware.com"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class ItemDetails {
  String? title, price;
  int? quantity;
  ItemDetails({this.price, this.quantity, this.title});
}

class Billings {
  String? title, price;

  Billings({this.price, this.title});
}
