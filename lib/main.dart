// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:bookmark_landing_page_ui/constants.dart';
import 'package:bookmark_landing_page_ui/faqModel.dart';
import 'package:bookmark_landing_page_ui/responsive/responsive.dart';

import 'utils/chromeButton.dart';
import 'utils/extensionContainer.dart';
import 'utils/firefoxButton.dart';
import 'utils/illusHero.dart';
import 'utils/moreinfoButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookMark Landing Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Rubik",
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List texts = [
  [
    "Bookmark in one click",
    "Organize your bookmarks however you like. Our simple drag-and-drop interface gives you complete control over how you manage your favourite sites."
  ],
  [
    "Intelligent search",
    "Our powerful search feature will help you find saved sites in no time at all. No need to trawl through all of your bookmarks."
  ],
  [
    "Share your bookmarks",
    "Easily share your bookmarks and collections with others. Create a shareable link that you can send at the click of a button."
  ]
];
int _index = 0;
ScrollController _controller = ScrollController();

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  List<FAQ> FAQs = [
    FAQ(
        header: "What is Bookmark?",
        body:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tincidunt justo eget ultricies fringilla. Phasellus blandit ipsum quis quam ornare mattis."),
    FAQ(
        header: "How can I request a new browser?",
        body:
            "Vivamus luctus eros aliquet convallis ultricies. Mauris augue massa, ultricies non ligula. Suspendisse imperdiet. Vivamus luctus eros aliquet convallis ultricies. Mauris augue massa, ultricies non ligula. Suspendisse imperdie tVivamus luctus eros aliquet convallis ultricies. Mauris augue massa, ultricies non ligula. Suspendisse imperdiet."),
    FAQ(
        header: "Is there a mobile app?",
        body:
            "Sed consectetur quam id neque fermentum accumsan. Praesent luctus vestibulum dolor, ut condimentum urna vulputate eget. Cras in ligula quis est pharetra mattis sit amet pharetra purus. Sed sollicitudin ex et ultricies bibendum."),
    FAQ(
        header: "What about other Chromium browsers?",
        body:
            "Integer condimentum ipsum id imperdiet finibus. Vivamus in placerat mi, at euismod dui. Aliquam vitae neque eget nisl gravida pellentesque non ut velit.")
  ];
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: Header(context),
          body: SingleChildScrollView(
            controller: _controller,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              if (Responsive.isMobile(context))
                Column(
                  children: [
                    IllustrationHero(),
                    Text(
                      "A Simple Bookmark Manager",
                      style: TextStyle(
                          color: darkBlue,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "A clean and simple interface to organize your favourite websites. Open a new browser tab and see your sites load instantly. Try it for free.",
                      style: TextStyle(fontSize: 18, color: grayishBlue),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ChromeButton(),
                        FireFoxButton(),
                      ],
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "A Simple Bookmark Manager",
                            style: TextStyle(
                                color: darkBlue,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "A clean and simple interface to organize your favourite websites. Open a new browser tab and see your sites load instantly. Try it for free.",
                            style: TextStyle(fontSize: 18, color: grayishBlue),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              ChromeButton(),
                              SizedBox(
                                width: 10,
                              ),
                              FireFoxButton()
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(flex: 4, child: IllustrationHero())
                  ],
                ),
              const SizedBox(
                height: 100,
              ),
              Text(
                "Features",
                style: TextStyle(
                    color: darkBlue, fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 5),
              Text(
                "Our aim is to make it quick and easy for you to access your favourite websites. Your bookmarks sync between your devices so you can access them on the go.",
                style: TextStyle(color: grayishBlue, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              if (Responsive.isMobile(context))
                featuresStack()
              else
                Column(
                  children: [
                    TabBar(
                        unselectedLabelColor: grayishBlue,
                        labelColor: darkBlue,
                        indicatorColor: softRed,
                        indicatorSize: TabBarIndicatorSize.tab,
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => softRed.withOpacity(0.1)),
                        onTap: (value) {
                          setState(() {
                            _index = value;
                          });
                        },
                        tabs: [
                          Tab(text: "Simple Bookmarking"),
                          Tab(text: "Speedy Searching"),
                          Tab(text: "Easy Sharing"),
                        ]),
                    SizedBox(
                      height: _size.height * 0.5,
                      child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: List.generate(3, (index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: CustomPaint(
                                    painter: IllusFeaturePainter(),
                                    child: Container(
                                      height: 250,
                                      alignment: Alignment.topRight,
                                      padding: EdgeInsets.only(left: 10),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: SizedBox(
                                        height: 300,
                                        width: 500,
                                        child: SvgPicture.asset(
                                          "assets/images/illustration-features-tab-${index + 1}.svg",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        texts[index][0],
                                        style: TextStyle(
                                            color: darkBlue,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        texts[index][1],
                                        style: TextStyle(
                                            color: grayishBlue, fontSize: 18),
                                      ),
                                      SizedBox(height: 10),
                                      MoreInfoButton()
                                    ],
                                  ),
                                )
                              ],
                            );
                          })),
                    ),
                  ],
                ),
              const SizedBox(
                height: 100,
              ),
              Text(
                "Download the extension",
                style: TextStyle(
                    color: darkBlue, fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "We’ve got more browsers in the pipeline. Please do let us know if you’ve got a favourite you’d like us to prioritize.",
                style: TextStyle(color: grayishBlue, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Responsive(
                  mobile: Column(
                    children: [
                      ExtensionContainer(
                          "assets/images/logo-chrome.svg", "Chrome", "62"),
                      ExtensionContainer(
                          "assets/images/logo-firefox.svg", "Firefox", "55"),
                      ExtensionContainer(
                          "assets/images/logo-opera.svg", "Opera", "46"),
                    ],
                  ),
                  tablet: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ExtensionContainer(
                            "assets/images/logo-chrome.svg", "Chrome", "62"),
                      ),
                      Flexible(
                        child: ExtensionContainer(
                            "assets/images/logo-firefox.svg", "Firefox", "55"),
                      ),
                      Flexible(
                        child: ExtensionContainer(
                            "assets/images/logo-opera.svg", "Opera", "46"),
                      ),
                    ],
                  ),
                  desktop: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: ExtensionContainer(
                            "assets/images/logo-chrome.svg", "Chrome", "62"),
                      ),
                      Flexible(
                        child: ExtensionContainer(
                            "assets/images/logo-firefox.svg", "Firefox", "55"),
                      ),
                      Flexible(
                        child: ExtensionContainer(
                            "assets/images/logo-opera.svg", "Opera", "46"),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Frequently Asked Questions",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25, fontWeight: FontWeight.w500, color: darkBlue),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Here are some of our FAQs. If you have any other questions you’d like answered please feel free to email us.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: grayishBlue),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: Responsive.isMobile(context)
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(horizontal: _size.width * 0.20),
                child: ExpansionPanelList(
                  expandIconColor: softRed,
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      FAQs[panelIndex].isExpanded = isExpanded;
                    });
                  },
                  children: FAQs.map<ExpansionPanel>((e) {
                    return ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            title: Text(e.header),
                          );
                        },
                        body: ListTile(
                          title: Text(e.body),
                        ),
                        isExpanded: e.isExpanded,
                        backgroundColor: Colors.white);
                  }).toList(),
                ),
              ),
              const SizedBox(height: 50),
              MoreInfoButton(),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                color: softBlue,
                padding: Responsive.isMobile(context)
                    ? EdgeInsets.symmetric(horizontal: 20, vertical: 30)
                    : EdgeInsets.symmetric(
                        horizontal: _size.width * 0.15, vertical: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "35,000+ already joined",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const Text(
                      "Stay up-to-date with what we’re doing",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Responsive(
                        mobile: Column(children: [
                          FormTextField(formkey: formkey),
                          const SizedBox(
                            height: 10,
                          ),
                          ContactButtton(formkey: formkey),
                        ]),
                        tablet: Row(
                          children: [
                            Expanded(child: FormTextField(formkey: formkey)),
                            const SizedBox(
                              width: 10,
                            ),
                            ContactButtton(formkey: formkey),
                          ],
                        ),
                        desktop: Row(
                          children: [
                            Expanded(child: FormTextField(formkey: formkey)),
                            const SizedBox(
                              width: 10,
                            ),
                            ContactButtton(formkey: formkey),
                          ],
                        ))
                  ],
                ),
              ),
              Responsive.isMobile(context)
                  ? Container(
                      height: 200,
                      width: double.infinity,
                      color: softRed.withOpacity(0.9),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                              "assets/images/logo-bookmark.svg",
                              width: 200,
                            ),
                            const Text("FEATURES",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300)),
                            const Text("PRICING",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300)),
                            const Text("CONTACT",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300)),
                          ]),
                    )
                  : Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: _size.width * 0.1, vertical: 25),
                      color: softRed.withOpacity(0.9),
                      child: Row(children: [
                        SvgPicture.asset(
                          "assets/images/logo-bookmark.svg",
                          width: 100,
                        ),
                        const SizedBox(width: 30),
                        const Text("FEATURES",
                            style: TextStyle(
                              fontSize: 12,
                            )),
                        const SizedBox(width: 10),
                        const Text("PRICING",
                            style: TextStyle(
                              fontSize: 12,
                            )),
                        const SizedBox(width: 10),
                        const Text("CONTACT",
                            style: TextStyle(
                              fontSize: 12,
                            )),
                        Spacer(),
                        SvgPicture.asset(
                          "assets/images/icon-facebook.svg",
                          height: 15,
                        ),
                        const SizedBox(width: 30),
                        SvgPicture.asset(
                          "assets/images/icon-twitter.svg",
                          height: 15,
                        )
                      ]),
                    ),
              const SizedBox(height: 20)
            ]),
          ),
          floatingActionButton: _controller.hasClients &&
                  _controller.position.pixels > 0.0 &&
                  Responsive.isMobile(context)
              ? Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: softBlue),
                  child: IconButton(
                      onPressed: () {
                        _controller.animateTo(0,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut);
                      },
                      icon: const Icon(
                        Icons.arrow_upward_rounded,
                        color: Colors.white,
                      )),
                )
              : null),
    );
  }

  Column featuresStack() {
    return Column(
      children: [
        const Divider(),
        GestureDetector(
          onTap: () {
            setState(() {
              _index = 0;
            });
          },
          child: Text(
            "Simple Bookmarking",
            style: TextStyle(
                color: grayishBlue, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Visibility(
          visible: _index == 0,
          replacement: const SizedBox(
            height: 20,
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            color: softRed,
            height: 3,
            width: 100,
          ),
        ),
        const Divider(
          height: 1,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _index = 1;
            });
          },
          child: Text(
            "Speedy Searching",
            style: TextStyle(
                color: grayishBlue, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Visibility(
          visible: _index == 1,
          replacement: const SizedBox(
            height: 20,
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            color: softRed,
            height: 3,
            width: 100,
          ),
        ),
        const Divider(
          height: 1,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _index = 2;
            });
          },
          child: Text(
            "Easy Sharing",
            style: TextStyle(
                color: grayishBlue, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Visibility(
          visible: _index == 2,
          replacement: const SizedBox(
            height: 20,
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            color: softRed,
            height: 3,
            width: 100,
          ),
        ),
        const Divider(
          height: 1,
        ),
        const SizedBox(height: 30),
        CustomPaint(
          painter: IllusFeaturePainter(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width * 0.8,
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: FittedBox(
              child: SvgPicture.asset(
                "assets/images/illustration-features-tab-${_index + 1}.svg",
                alignment: Alignment.topRight,
              ),
            ),
          ),
        ),
        Text(
          texts[_index][0],
          style: TextStyle(
              color: darkBlue, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          texts[_index][1],
          textAlign: TextAlign.center,
          style: TextStyle(color: grayishBlue, fontSize: 18),
        ),
      ],
    );
  }

  AppBar Header(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(
          "assets/images/logo-bookmark.svg",
        ),
        actions: [
          Responsive.isMobile(context)
              ? Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      showAdaptiveDialog(
                        context: context,
                        builder: (context) => Dialog.fullscreen(
                            backgroundColor: darkBlue.withOpacity(0.9),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: SvgPicture.asset(
                                        "assets/images/icon-close.svg",
                                        height: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                      color: grayishBlue.withOpacity(0.6),
                                      height: 50),
                                  Text("FEATURES",
                                      style: TextStyle(
                                          color: grayishBlue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25)),
                                  Divider(
                                      color: grayishBlue.withOpacity(0.6),
                                      height: 50),
                                  Text("PRICING",
                                      style: TextStyle(
                                          color: grayishBlue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25)),
                                  Divider(
                                      color: grayishBlue.withOpacity(0.6),
                                      height: 50),
                                  Text("CONTACT",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: grayishBlue,
                                          fontWeight: FontWeight.w500)),
                                  Divider(
                                      color: grayishBlue.withOpacity(0.6),
                                      height: 50),
                                  MaterialButton(
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.white, width: 2),
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 50,
                                    minWidth: double.infinity - 20,
                                    child: const Text("LOGIN",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/icon-facebook.svg"),
                                      const SizedBox(width: 30),
                                      SvgPicture.asset(
                                          "assets/images/icon-twitter.svg")
                                    ],
                                  ),
                                  const SizedBox(height: 40)
                                ],
                              ),
                            )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: SvgPicture.asset(
                        "assets/images/icon-hamburger.svg",
                      ),
                    ),
                  );
                })
              : Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(foregroundColor: grayishBlue),
                      child: Text(
                        "FEATURES",
                        style: TextStyle(letterSpacing: 1.3),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(foregroundColor: grayishBlue),
                      child: Text(
                        "PRICING",
                        style: TextStyle(letterSpacing: 1.3),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(foregroundColor: grayishBlue),
                      child: Text(
                        "CONTACT",
                        style: TextStyle(letterSpacing: 1.3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: softRed,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Text("LOGIN")),
                    )
                  ],
                ),
        ]);
  }
}

class ContactButtton extends StatelessWidget {
  const ContactButtton({
    super.key,
    required this.formkey,
  });

  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          formkey.currentState!.validate();
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: softRed),
        child: const Text(
          "Contact US",
          style: TextStyle(color: Colors.white),
        ));
  }
}

class FormTextField extends StatelessWidget {
  const FormTextField({
    super.key,
    required this.formkey,
  });

  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            border:
                OutlineInputBorder(borderSide: BorderSide(color: grayishBlue)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter an email";
            } else {}
            SystemChannels.textInput.invokeMethod("TextInput.hide");
            return null;
          },
        ));
  }
}

class IllusFeaturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = softBlue;
    Path path = Path();
    path.moveTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.6, size.height * 0.25);
    path.cubicTo(size.width * 0.6, size.height * 0.25, size.width * 0.9,
        size.height * 0.625, size.width * 0.6, size.height);

    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
