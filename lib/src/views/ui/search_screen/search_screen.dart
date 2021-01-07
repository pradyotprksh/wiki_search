import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

/// A search screen which will handle all the ui realted work.
class SearchScreen extends StatelessWidget {
  final SearchInterface _searchInterface = Get.find();

  @override
  Widget build(BuildContext context) => BlocListener<SearchBloc, SearchState>(
    listener: (_, state) {
      if (state.searchStatus == SearchStatus.error) {
        Utility.showError(state.errorMessage);
      }
    },
    child: Scaffold(
      extendBody: true,
      backgroundColor: Get.theme.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Utility.openHistoryPage();
        },
        backgroundColor: ColorsValue.primaryColor,
        child: const Icon(
          Icons.history,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: TextFormField(
          initialValue: '',
          style: Styles.black18,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            filled: true,
            hintStyle: Styles.black18,
            hintText: StringConstants.search,
            fillColor: Colors.white70,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          onChanged: (value) {
            _searchInterface.buildContext = context;
            _searchInterface.query.value = value;
          },
        ),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (_, state) => Stack(
          children: [
                (state.wikiSearchResponse?.query?.pages?.length ?? 0) > 0
                    ? ListView.builder(
                        padding: Dimens.margin0_10_0_0,
                        shrinkWrap: true,
                        itemCount:
                            state.wikiSearchResponse?.query?.pages?.length ?? 0,
                        itemBuilder: (_, position) {
                          var singlePage =
                              state.wikiSearchResponse.query.pages[position];
                          return Card(
                            margin: Dimens.padding5,
                            child: ListTile(
                              onTap: () {
                                Utility.openUrl(singlePage.title);
                              },
                              leading: (singlePage.thumbnail?.source ?? '')
                                      .isNotEmpty
                                  ? Image.network(
                                      singlePage.thumbnail.source,
                                      width: Dimens.fifty,
                                      height: Dimens.fifty,
                                    )
                                  : Image.asset(
                                      AssetsConstants.defaultLogo,
                                      width: Dimens.fifty,
                                      height: Dimens.fifty,
                                    ),
                              title: Text(
                                singlePage.title ?? '',
                                style: Styles.black18,
                              ),
                              subtitle: Text(
                                _getDescription(singlePage.terms),
                              ),
                            ),
                          );
                        },
                      )
                    : Padding(
                        padding: Dimens.padding15,
                        child: Center(
                          child: TypewriterAnimatedTextKit(
                            speed: const Duration(milliseconds: 100),
                            text: [
                              StringConstants.emptyText,
                            ],
                            textStyle: Styles.boldAppColor30,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                if (state.searchStatus == SearchStatus.loading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
        ),
      ),
    ),
  );

  String _getDescription(Terms terms) {
    if (terms == null ||
        terms.description == null ||
        terms.description.isEmpty) {
      return '';
    }
    return terms.description.first;
  }
}
