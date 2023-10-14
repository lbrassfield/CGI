// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:cgi_app/small_attributes.dart';
import 'package:cgi_app/AppBar/app_bar.dart';

class OurProcess extends StatelessWidget {
  const OurProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60), child: MyAppBar()),
        body: GradientBackgroundContainer(
          pageData: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: const BoxDecoration(
                        color: Colors.indigo,
                        // border: Border.all(width: 1.0, color: Colors.black),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Our Process",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.04,
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 1.0, color: Colors.black),
                          // ),
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Ingest",
                              style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.04,
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 1.0, color: Colors.black),
                          // ),
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Transform",
                              style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.04,
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 1.0, color: Colors.black),
                          // ),
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Visualize",
                              style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.3,
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 1.0, color: Colors.black),
                          // ),
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "We've designed a user-friendly, hassle-free system that makes gathering \nand incorporating your data a breeze. With intuitive interfaces and seamless \nintegration, you can effortlessly connect your data sources or upload your data \nvia flat file, and watch as our advanced algorithms do the heavy lifting.\n \u2022 All data is stored in secure cloud storage\n \u2022 Our ingestion process runs data-quality checks \n giving you real time feedback on the quality of your data\n \u2022 Data can then be viewed in our user console as a table, as to\n make sure you are confident in its integrity",
                              style:
                                  TextStyle(color: Colors.indigo, height: 1.5),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.3,
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 1.0, color: Colors.black),
                          // ),
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Built in the cloud, we process datasets with speed and precision, \nuncovering hidden patterns and trends that are vital for your business success. \nWhat sets our data-transformation engine apart is its adaptability and scalability, \nensuring it evolves alongside your needs, regardless of your industry or the \nsize of your data.\n \u2022 Work with us to ensure all transformations on your data are accurate and \nprocessing accurately\n \u2022 Transformations are run in real time, so when data is added to the application, \nresulting visulizations are updated",
                              style:
                                  TextStyle(color: Colors.indigo, height: 1.5),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.3,
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 1.0, color: Colors.black),
                          // ),
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Our self-serve analytics dashboards are designed with you in mind, putting the power \nof data at your fingertips. Our intuitive interface allows anyone in your organization \nto effortlessly create, customize, and explore dynamic visualizations. \nWhether you're tracking key performance indicators, analyzing market trends, or \nmonitoring customer behavior, our dashboards provide real-time insights \nthat drive informed decision-making.\n \u2022 Dashboards are pre-built, so customization isn't always necessary\n \u2022 Have customer support build custom reports & dashboards for you \n \u2022 Intuitively schedule reports to be delivered to you by email, text, etc.",
                              style:
                                  TextStyle(color: Colors.indigo, height: 1.5),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.3,
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 1.0, color: Colors.black),
                          // ),
                          child: Image.asset(
                            'assets/cloud_file_types.png',
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.7,
                          // decoration: BoxDecoration(
                          //   border: Border.all(width: 1.0, color: Colors.black),
                          // ),
                          child: Image.asset(
                            'assets/CGI_product_info_no_bg.png',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
