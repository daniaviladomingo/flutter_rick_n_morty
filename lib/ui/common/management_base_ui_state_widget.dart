import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/model/base_ui_state.dart';

class ManagementBaseUiStateWidget<T, SuccessWidget extends Widget> extends StatelessWidget {
  final BaseUiState<T> state;
  final SuccessWidget Function(T) successView;
  final VoidCallback retry;
  final Widget? customLoadingWidget;
  final Widget? customEmptyWidget;
  final Widget? customErrorWidget;

  const ManagementBaseUiStateWidget({
    super.key,
    required this.state,
    required this.successView,
    required this.retry,
    this.customLoadingWidget,
    this.customEmptyWidget,
    this.customErrorWidget
  });

  @override
  Widget build(BuildContext context) => state.when(
      idle: () => _idleWidget(),
      loading: () => customLoadingWidget ?? _loadingWidget(),
      empty: () => customEmptyWidget ?? _emptyWidget(),
      error: (exception) => customEmptyWidget ?? _errorWidget(exception),
      success: (data) => _successWidget(data));

  Widget _idleWidget() => const Center();

  Widget _loadingWidget() => const Center(
      child: CircularProgressIndicator()
  );

  Widget _emptyWidget() => const Center(
      child: Text(
          "No data to show",
          style: TextStyle(fontSize: 20)
      )
  );

  Widget _errorWidget(Exception exception) => Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("An error has occurred"),
            OutlinedButton(onPressed: retry, child: const Text("Try again"))
          ]
      )
  );

  Widget _successWidget(T data) => successView(data);
}
