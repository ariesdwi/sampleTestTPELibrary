import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:tpe_component_sdk/tpe_component_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TPE Refine Button Storybook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TPEComponentButtonStorybook(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Storybook implementation using your TPE Component SDK
class TPEComponentButtonStorybook extends StatefulWidget {
  const TPEComponentButtonStorybook({super.key});

  @override
  State<TPEComponentButtonStorybook> createState() =>
      _TPEComponentButtonStorybookState();
}

class _TPEComponentButtonStorybookState
    extends State<TPEComponentButtonStorybook> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Refine Button"),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(showStorybook ? Icons.toggle_on : Icons.toggle_off),
            onPressed: () {
              setState(() {
                showStorybook = !showStorybook;
              });
            },
            tooltip: showStorybook ? 'Show Default' : 'Show Storybook',
          ),
        ],
      ),
      body: showStorybook
          ? Storybook(
              initialStory: 'TPERefineButton / Customizable',
              wrapperBuilder: (context, child) => Container(
                padding: const EdgeInsets.all(20),
                color: Colors.grey.shade100,
                child: child,
              ),
              stories: [
                Story(
                  name: 'TPERefineButton / Customizable',
                  builder: (context) {
                    final title = context.knobs.text(
                      label: 'Title',
                      initial: 'Simpan',
                    );

                    final icon = context.knobs.options<IconData?>(
                      label: 'Icon',
                      initial: Icons.save,
                      options: const [
                        Option(label: 'Save', value: Icons.save),
                        Option(label: 'Edit', value: Icons.edit),
                        Option(label: 'Delete', value: Icons.delete),
                        Option(label: 'Send', value: Icons.send),
                        Option(label: 'Add', value: Icons.add),
                        Option(label: 'Download', value: Icons.download),
                        Option(label: 'Upload', value: Icons.upload),
                        Option(label: 'None', value: null),
                      ],
                    );

                    final variant = context.knobs.options<TPEButtonVariant>(
                      label: 'Variant',
                      initial: TPEButtonVariant.primary,
                      options: const [
                        Option(
                            label: 'Primary', value: TPEButtonVariant.primary),
                        Option(
                            label: 'Outline', value: TPEButtonVariant.outline),
                        Option(
                            label: 'Secondary',
                            value: TPEButtonVariant.secondary),
                        Option(label: 'Plain', value: TPEButtonVariant.plain),
                      ],
                    );

                    final size = context.knobs.options<TPEButtonSize>(
                      label: 'Size',
                      initial: TPEButtonSize.medium,
                      options: const [
                        Option(label: 'Small', value: TPEButtonSize.small),
                        Option(label: 'Medium', value: TPEButtonSize.medium),
                        // Option(label: 'Large', value: TPEButtonSize.large),
                      ],
                    );

                    final roundType = context.knobs.options<TPEButtonRound>(
                      label: 'Round Type',
                      initial: TPEButtonRound.pill,
                      options: const [
                        Option(label: 'None', value: TPEButtonRound.none),
                        Option(label: 'Rounded', value: TPEButtonRound.rounded),
                        Option(label: 'Pill', value: TPEButtonRound.pill),
                      ],
                    );

                    final isCentered = context.knobs.boolean(
                      label: 'Centered',
                      initial: true,
                    );

                    final isLoading = context.knobs.boolean(
                      label: 'Loading',
                      initial: false,
                    );

                    final isEnabled = context.knobs.boolean(
                      label: 'Enabled',
                      initial: true,
                    );

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TPERefineButton(
                          title: title,
                          icon: icon,
                          variant: variant,
                          size: size,
                          roundType: roundType,
                          isCentered: isCentered,
                          isLoading: isLoading,
                          isEnabled: isEnabled,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("$title Button Pressed"),
                                backgroundColor: Colors.green.shade700,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Current Settings:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Variant: $variant | Size: $size | Round: $roundType',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Icon: ${icon != null ? icon!.name : "None"} | Centered: $isCentered',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Loading: $isLoading | Enabled: $isEnabled',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
                Story(
                  name: 'TPERefineButton / Examples',
                  builder: (context) {
                    return ListView(
                      children: [
                        _buildExampleSection(context, 'Primary Variant', [
                          _ExampleButtonConfig(
                            title: 'Save',
                            icon: Icons.save,
                            variant: TPEButtonVariant.primary,
                          ),
                          _ExampleButtonConfig(
                            title: 'Submit',
                            icon: Icons.send,
                            variant: TPEButtonVariant.primary,
                          ),
                          _ExampleButtonConfig(
                            title: 'Confirm',
                            icon: Icons.check,
                            variant: TPEButtonVariant.primary,
                          ),
                        ]),
                        _buildExampleSection(context, 'Outline Variant', [
                          _ExampleButtonConfig(
                            title: 'Edit',
                            icon: Icons.edit,
                            variant: TPEButtonVariant.outline,
                          ),
                          _ExampleButtonConfig(
                            title: 'Cancel',
                            icon: Icons.close,
                            variant: TPEButtonVariant.outline,
                          ),
                          _ExampleButtonConfig(
                            title: 'Back',
                            icon: Icons.arrow_back,
                            variant: TPEButtonVariant.outline,
                          ),
                        ]),
                        _buildExampleSection(context, 'Secondary Variant', [
                          _ExampleButtonConfig(
                            title: 'Options',
                            icon: Icons.settings,
                            variant: TPEButtonVariant.secondary,
                          ),
                          _ExampleButtonConfig(
                            title: 'Help',
                            icon: Icons.help,
                            variant: TPEButtonVariant.secondary,
                          ),
                          _ExampleButtonConfig(
                            title: 'Info',
                            icon: Icons.info,
                            variant: TPEButtonVariant.secondary,
                          ),
                        ]),
                        _buildExampleSection(context, 'Plain Variant', [
                          _ExampleButtonConfig(
                            title: 'Delete',
                            icon: Icons.delete,
                            variant: TPEButtonVariant.plain,
                          ),
                          _ExampleButtonConfig(
                            title: 'Download',
                            icon: Icons.download,
                            variant: TPEButtonVariant.plain,
                          ),
                          _ExampleButtonConfig(
                            title: 'Share',
                            icon: Icons.share,
                            variant: TPEButtonVariant.plain,
                          ),
                        ]),
                        _buildExampleSection(context, 'Different Sizes', [
                          _ExampleButtonConfig(
                            title: 'Small',
                            icon: Icons.star,
                            variant: TPEButtonVariant.primary,
                            size: TPEButtonSize.small,
                          ),
                          _ExampleButtonConfig(
                            title: 'Medium',
                            icon: Icons.star,
                            variant: TPEButtonVariant.primary,
                            size: TPEButtonSize.medium,
                          ),
                        ]),
                        _buildExampleSection(context, 'Different Round Types', [
                          _ExampleButtonConfig(
                            title: 'None',
                            icon: Icons.square,
                            variant: TPEButtonVariant.outline,
                            roundType: TPEButtonRound.none,
                          ),
                          _ExampleButtonConfig(
                            title: 'Rounded',
                            icon: Icons.rounded_corner,
                            variant: TPEButtonVariant.outline,
                            roundType: TPEButtonRound.rounded,
                          ),
                          _ExampleButtonConfig(
                            title: 'Pill',
                            icon: Icons.circle,
                            variant: TPEButtonVariant.outline,
                            roundType: TPEButtonRound.pill,
                          ),
                        ]),
                        _buildExampleSection(context, 'Loading States', [
                          _ExampleButtonConfig(
                            title: 'Processing',
                            icon: Icons.refresh,
                            variant: TPEButtonVariant.primary,
                            isLoading: true,
                          ),
                          _ExampleButtonConfig(
                            title: 'Saving',
                            icon: Icons.save,
                            variant: TPEButtonVariant.outline,
                            isLoading: true,
                          ),
                          _ExampleButtonConfig(
                            title: 'Uploading',
                            icon: Icons.upload,
                            variant: TPEButtonVariant.secondary,
                            isLoading: true,
                          ),
                        ]),
                        _buildExampleSection(context, 'Disabled States', [
                          _ExampleButtonConfig(
                            title: 'Disabled',
                            icon: Icons.lock,
                            variant: TPEButtonVariant.primary,
                            isEnabled: false,
                          ),
                          _ExampleButtonConfig(
                            title: 'Inactive',
                            icon: Icons.block,
                            variant: TPEButtonVariant.outline,
                            isEnabled: false,
                          ),
                          _ExampleButtonConfig(
                            title: 'Unavailable',
                            icon: Icons.not_interested,
                            variant: TPEButtonVariant.secondary,
                            isEnabled: false,
                          ),
                        ]),
                        _buildExampleSection(context, 'Icon Only', [
                          _ExampleButtonConfig(
                            title: '',
                            icon: Icons.favorite,
                            variant: TPEButtonVariant.primary,
                          ),
                          _ExampleButtonConfig(
                            title: '',
                            icon: Icons.shopping_cart,
                            variant: TPEButtonVariant.outline,
                          ),
                          _ExampleButtonConfig(
                            title: '',
                            icon: Icons.notifications,
                            variant: TPEButtonVariant.secondary,
                          ),
                        ]),
                      ],
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'TPE Refine Button Examples',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TPERefineButton(
                    title: "Simpan",
                    icon: Icons.save,
                    variant: TPEButtonVariant.primary,
                    size: TPEButtonSize.medium,
                    roundType: TPEButtonRound.pill,
                    isCentered: true,
                    isEnabled: true,
                    isLoading: false,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Simpan pressed!"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  TPERefineButton(
                    title: "Batal",
                    icon: Icons.cancel,
                    variant: TPEButtonVariant.outline,
                    size: TPEButtonSize.medium,
                    roundType: TPEButtonRound.pill,
                    isCentered: true,
                    isEnabled: true,
                    isLoading: false,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Batal pressed!"),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  TPERefineButton(
                    title: "Loading...",
                    icon: Icons.refresh,
                    variant: TPEButtonVariant.secondary,
                    size: TPEButtonSize.medium,
                    roundType: TPEButtonRound.pill,
                    isCentered: true,
                    isEnabled: true,
                    isLoading: true,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Toggle the switch in app bar to see Storybook',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildExampleSection(
    BuildContext context,
    String title,
    List<_ExampleButtonConfig> configs,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: configs.map((config) {
              return TPERefineButton(
                title: config.title,
                icon: config.icon,
                variant: config.variant,
                size: config.size,
                roundType: config.roundType,
                isCentered: config.isCentered,
                isLoading: config.isLoading,
                isEnabled: config.isEnabled,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${config.title} Button pressed"),
                      backgroundColor: _getSnackbarColor(config.variant),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Divider(),
        ],
      ),
    );
  }

  Color _getSnackbarColor(TPEButtonVariant variant) {
    switch (variant) {
      case TPEButtonVariant.primary:
        return Colors.green.shade700;
      case TPEButtonVariant.outline:
        return Colors.blue.shade700;
      case TPEButtonVariant.secondary:
        return Colors.orange.shade700;
      case TPEButtonVariant.plain:
        return Colors.purple.shade700;
    }
  }
}

class _ExampleButtonConfig {
  final String title;
  final IconData? icon;
  final TPEButtonVariant variant;
  final TPEButtonSize size;
  final TPEButtonRound roundType;
  final bool isCentered;
  final bool isLoading;
  final bool isEnabled;

  _ExampleButtonConfig({
    required this.title,
    this.icon,
    required this.variant,
    this.size = TPEButtonSize.medium,
    this.roundType = TPEButtonRound.pill,
    this.isCentered = true,
    this.isLoading = false,
    this.isEnabled = true,
  });
}

// Extension to get icon name for display
extension IconDataExtension on IconData {
  String get name {
    switch (this) {
      case Icons.save:
        return 'save';
      case Icons.edit:
        return 'edit';
      case Icons.delete:
        return 'delete';
      case Icons.send:
        return 'send';
      case Icons.add:
        return 'add';
      case Icons.download:
        return 'download';
      case Icons.upload:
        return 'upload';
      case Icons.close:
        return 'close';
      case Icons.arrow_back:
        return 'arrow_back';
      case Icons.settings:
        return 'settings';
      case Icons.help:
        return 'help';
      case Icons.info:
        return 'info';
      case Icons.share:
        return 'share';
      case Icons.refresh:
        return 'refresh';
      case Icons.lock:
        return 'lock';
      case Icons.block:
        return 'block';
      case Icons.not_interested:
        return 'not_interested';
      case Icons.favorite:
        return 'favorite';
      case Icons.shopping_cart:
        return 'shopping_cart';
      case Icons.notifications:
        return 'notifications';
      case Icons.check:
        return 'check';
      case Icons.cancel:
        return 'cancel';
      case Icons.star:
        return 'star';
      case Icons.square:
        return 'square';
      case Icons.rounded_corner:
        return 'rounded_corner';
      case Icons.circle:
        return 'circle';
      default:
        return 'unknown';
    }
  }
}
