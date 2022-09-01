import 'package:flutter/material.dart';
import 'package:game_with_bloc/product/constant/string_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../game/model/data_model.dart';
import 'package:kartal/kartal.dart';

class DetailView extends StatelessWidget {
  DetailView({super.key, required this.dataModel});
  DataModel? dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                height: context.dynamicWidth(0.6),
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(dataModel?.image ?? ""),
              ),
              Padding(
                padding: context.horizontalPaddingLow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.dynamicWidth(0.05),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(dataModel?.title ?? "",
                              style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
                        ),
                        if (dataModel?.worth != StringConstants.nA)
                          const SizedBox(
                            height: 12,
                          ),
                        if (dataModel?.worth != StringConstants.nA)
                          Container(
                            padding: context.paddingMedium,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(dataModel?.worth ?? "", style: context.textTheme.bodyLarge),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: context.dynamicWidth(0.04),
                    ),
                    Text("${StringConstants.availableIn} ${dataModel?.platforms}", style: context.textTheme.bodyText1),
                    SizedBox(
                      height: context.dynamicWidth(0.04),
                    ),
                    Text(StringConstants.gameDescription, style: context.textTheme.bodyLarge),
                    Text(
                      dataModel?.description ?? "",
                    ),
                    SizedBox(
                      height: context.dynamicWidth(0.07),
                    ),
                    Text(StringConstants.stepsToGetIt, style: context.textTheme.bodyLarge),
                    SizedBox(
                      height: context.dynamicWidth(0.01),
                    ),
                    Text(
                      dataModel?.instructions ?? "",
                      style: const TextStyle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
