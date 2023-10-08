import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/common/util/flutter_extension_methods.dart';
import 'package:rick_and_morty/ui/model/resources_ui_state.dart';

class ManagementResourceUiStateWidget<T, SuccessWidget extends Widget> extends StatelessWidget {
  final ResourceUiState<T> state;
  final SuccessWidget Function(T) successView;
  final VoidCallback? onCheckAgain;
  final VoidCallback? onTryAgain;
  final void Function(Reason)? onFailure;
  final Widget? customLoadingWidget;
  final Widget? customEmptyWidget;
  final Widget Function(Reason)? customErrorWidget;

  const ManagementResourceUiStateWidget({
    super.key,
    required this.state,
    required this.successView,
    this.onCheckAgain,
    this.onTryAgain,
    this.onFailure,
    this.customLoadingWidget,
    this.customEmptyWidget,
    this.customErrorWidget,
  });

  @override
  Widget build(BuildContext context) => state.when(
        idle: () => const SizedBox.shrink(),
        loading: () => customLoadingWidget ?? const _LoadingWidget(),
        empty: () => customEmptyWidget ?? _EmptyWidget(onCheckAgain),
        failure: (reason) {
          onFailure ?? (reason);
          if (customErrorWidget != null) {
            return customErrorWidget!(reason);
          }
          return _ErrorWidget(onTryAgain);
        },
        success: (data) => successView(data),
      );
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  final VoidCallback? onCheckAgain;

  const _EmptyWidget(this.onCheckAgain);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            context.string.noDataToShow,
            style: const TextStyle(fontSize: 20),
          ),
          Offstage(
            offstage: onCheckAgain != null,
            child: OutlinedButton(
              onPressed: onCheckAgain,
              child: Text(context.string.checkAgain),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final VoidCallback? onTryAgain;

  const _ErrorWidget(this.onTryAgain);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.string.anErrorHasOccurred),
          Offstage(
            offstage: onTryAgain != null,
            child: OutlinedButton(
              onPressed: onTryAgain,
              child: Text(context.string.tryAgain),
            ),
          ),
        ],
      ),
    );
  }
}
