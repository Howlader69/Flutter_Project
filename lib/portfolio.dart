import 'package:flutter/material.dart';
import 'package:portfolio/components/about.dart';
import 'package:portfolio/components/education.dart';
import 'package:portfolio/components/footer.dart';
import 'package:portfolio/components/skills.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {

  List<Widget> navItems=[];
  @override
  void initState() {
    navItems=[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: (){}, child: const  Text('Education')),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: (){
          Scrollable.ensureVisible(skillkey.currentContext!);
        }, child: const  Text('Skills')),
      ),
    ];
    super.initState();
  }

  bool isMobile=false;
  final skillkey=GlobalKey();
  @override

  Widget build(BuildContext context) {
    isMobile=MediaQuery.of(context).size.width >700 ?false : true;
    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio'),
        actions: isMobile? null: navItems,
      ),
      drawer: isMobile? Drawer(child: ListView(children: navItems,),):null,
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 20,
                children: [
                  About(),
                  Education(),
                ],
              ),
              Skills(
                key: skillkey,
              ),
              Footer(),
            ],
          ),
        ),
      )
    );
  }
}
