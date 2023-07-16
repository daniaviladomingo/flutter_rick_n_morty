import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/base/base_bloc_state.dart';

class ManagementBaseBlocStateWidget<T, SuccessWidget extends Widget>
    extends StatelessWidget {
  final BaseBlocState<T> state;
  final SuccessWidget Function(T) successView;
  final VoidCallback retry;

  const ManagementBaseBlocStateWidget(
      {super.key,
      required this.state,
      required this.successView,
      required this.retry});

  @override
  Widget build(BuildContext context) => state.when(
      idle: () => _idleWidget(),
      loading: () => Center(child: _loadingWidget()),
      error: (exception) => Center(child: _errorWidget(exception)),
      success: (data) => _successWidget(data));

  Widget _idleWidget() => const Center();

  Widget _loadingWidget() => const CircularProgressIndicator();

  Widget _errorWidget(Exception exception) => Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("An error has occurred"),
                OutlinedButton(onPressed: retry, child: const Text("Try again"))
      ])
  );

  Widget _successWidget(T data) => successView(data);
}
