import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch/utils.dart/color_const.dart';

import '../controller/stopwatch_controller.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => StopwatchScreenState();
}

class StopwatchScreenState extends State<StopwatchScreen> {
  final controller = Get.put(StopWatchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.location_searching_rounded),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const Text(
                  'STOPWATCH',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: Divider(
                      color: Colors.white.withOpacity(0.5),
                      thickness: 4,
                      indent: 60,
                      endIndent: 60,
                    ),
                  ),
                ),
                const SizedBox(height: 100),

                Center(
                  child: SizedBox(
                    width: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "HOURS",
                          style: TextStyle(
                            color: AppColor.textprimarycolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "MINUTES",
                          style: TextStyle(
                            color: AppColor.textprimarycolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "SECONDS",
                          style: TextStyle(
                            color: AppColor.textprimarycolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Obx(
                    () => Text(
                      "${controller.hours.toString().padLeft(2, '0')}:"
                      "${controller.minutes.toString().padLeft(2, '0')}:"
                      "${controller.seconds.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Digital-7',
                        letterSpacing: 2,
                        shadows: [
                          Shadow(color: Colors.white70, blurRadius: 8),
                          Shadow(color: Colors.white38, blurRadius: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Obx(
                () => ElevatedButton(
                  onPressed: () {
                    if (controller.isRunning) {
                      controller.stop();
                    } else {
                      controller.start();
                    }
                  },
                  child: Text(
                    controller.isRunning ? "Stop" : "Start",
                    style: TextStyle(
                      color: AppColor.buttontextcolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: ElevatedButton(
                onPressed: controller.reset,
                child: const Text(
                  "Reset",
                  style: TextStyle(
                    color: AppColor.buttontextcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
