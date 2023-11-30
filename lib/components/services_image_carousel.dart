import 'package:flutter/material.dart';
import 'package:my_business_app/models/services.dart';

class ServicesCarousel extends StatefulWidget {
  const ServicesCarousel({
    super.key,
    required this.services,
  });

  final List<Service> services;

  @override
  State<ServicesCarousel> createState() {
    return _ServicesCarouselState();
  }
}

class _ServicesCarouselState extends State<ServicesCarousel> {
  int? activeIndex;

  void setActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.services.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
        ),
        child: GestureDetector(
          onTap: () {
            setActiveIndex(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: activeIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    widget.services[index].image,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.services[index].title,
              )
            ],
          ),
        ),
      ),
    );
  }
}
