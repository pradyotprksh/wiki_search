import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Get.theme.backgroundColor,
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      backgroundColor: ColorsValue.primaryColor,
      child: const Icon(
        Icons.history,
      ),
    ),
    appBar: AppBar(
      automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: Dimens.zero,
          title: BlocBuilder<SearchBloc, SearchState>(
            builder: (_, state) => TextFormField(
              initialValue: '',
              style: Styles.black18,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                filled: true,
                hintStyle: Styles.black18,
                hintText: StringConstants.search,
                fillColor: Colors.white70,
              ),
              onChanged: (value) {
                context.read<SearchBloc>().add(
                      SearchQueryChange(
                        query: value,
                      ),
                    );
              },
            ),
          ),
        ),
    body: ListView(
      shrinkWrap: true,
    ),
  );
}
