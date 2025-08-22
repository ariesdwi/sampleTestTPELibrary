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
      title: 'TPE Text Group Storybook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TPEComponentTextGroupStorybook(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TPEComponentTextGroupStorybook extends StatefulWidget {
  const TPEComponentTextGroupStorybook({super.key});

  @override
  State<TPEComponentTextGroupStorybook> createState() =>
      _TPEComponentTextGroupStorybookState();
}

class _TPEComponentTextGroupStorybookState
    extends State<TPEComponentTextGroupStorybook> {
  bool showStorybook = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TPE Text Group"),
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
              initialStory: 'TPETextGroup / Customizable',
              wrapperBuilder: (context, child) => Container(
                padding: const EdgeInsets.all(20),
                color: Colors.grey.shade100,
                child: child,
              ),
              stories: [
                Story(
                  name: 'TPETextGroup / Customizable',
                  builder: (context) {
                    final title = context.knobs.text(
                      label: 'Title',
                      initial: 'Welcome to TPE!',
                    );

                    final description = context.knobs.text(
                      label: 'Description',
                      initial:
                          'To open a new account, please visit BRI branch office. New account registrations can only be processed at our branch office.',
                    );

                    final alignment = context.knobs.options<MainAxisAlignment>(
                      label: 'Vertical Alignment',
                      initial: MainAxisAlignment.center,
                      options: const [
                        Option(label: 'Start', value: MainAxisAlignment.start),
                        Option(
                            label: 'Center', value: MainAxisAlignment.center),
                        Option(label: 'End', value: MainAxisAlignment.end),
                        Option(
                            label: 'Space Between',
                            value: MainAxisAlignment.spaceBetween),
                        Option(
                            label: 'Space Around',
                            value: MainAxisAlignment.spaceAround),
                        Option(
                            label: 'Space Evenly',
                            value: MainAxisAlignment.spaceEvenly),
                      ],
                    );

                    final crossAlignment =
                        context.knobs.options<CrossAxisAlignment>(
                      label: 'Horizontal Alignment',
                      initial: CrossAxisAlignment.center,
                      options: const [
                        Option(label: 'Start', value: CrossAxisAlignment.start),
                        Option(
                            label: 'Center', value: CrossAxisAlignment.center),
                        Option(label: 'End', value: CrossAxisAlignment.end),
                        Option(
                            label: 'Stretch',
                            value: CrossAxisAlignment.stretch),
                      ],
                    );

                    final textAlign = context.knobs.options<TextAlign>(
                      label: 'Text Alignment',
                      initial: TextAlign.center,
                      options: const [
                        Option(label: 'Left', value: TextAlign.left),
                        Option(label: 'Center', value: TextAlign.center),
                        Option(label: 'Right', value: TextAlign.right),
                        Option(label: 'Justify', value: TextAlign.justify),
                      ],
                    );

                    final titleVariant = context.knobs.options<TPETextVariant>(
                      label: 'Title Variant',
                      initial: TPETextVariant.text16SemiBold600,
                      options: const [
                        Option(
                            label: 'Text14SemiBold600',
                            value: TPETextVariant.text14SemiBold600),
                        Option(
                            label: 'Text16SemiBold600',
                            value: TPETextVariant.text16SemiBold600),
                        Option(
                            label: 'Text20SemiBold700',
                            value: TPETextVariant.text20SemiBold700),
                        Option(label: 'Primary', value: TPETextVariant.primary),
                        Option(
                            label: 'Secondary',
                            value: TPETextVariant.secondary),
                      ],
                    );

                    final titleColor = context.knobs.options<Color>(
                      label: 'Title Color',
                      initial: Colors.black,
                      options: const [
                        Option(label: 'Black', value: Colors.black),
                        Option(label: 'Blue', value: Colors.blue),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Green', value: Colors.green),
                        Option(label: 'Purple', value: Colors.purple),
                        Option(label: 'Orange', value: Colors.orange),
                        Option(label: 'Teal', value: Colors.teal),
                        Option(label: 'Indigo', value: Colors.indigo),
                      ],
                    );

                    final descVariant = context.knobs.options<TPETextVariant>(
                      label: 'Description Variant',
                      initial: TPETextVariant.secondary,
                      options: const [
                        Option(
                            label: 'Text14SemiBold600',
                            value: TPETextVariant.text14SemiBold600),
                        Option(
                            label: 'Text16SemiBold600',
                            value: TPETextVariant.text16SemiBold600),
                        Option(
                            label: 'Text20SemiBold700',
                            value: TPETextVariant.text20SemiBold700),
                        Option(label: 'Primary', value: TPETextVariant.primary),
                        Option(
                            label: 'Secondary',
                            value: TPETextVariant.secondary),
                      ],
                    );

                    final descColor = context.knobs.options<Color>(
                      label: 'Description Color',
                      initial: Colors.black54,
                      options: const [
                        Option(label: 'Black54', value: Colors.black54),
                        Option(label: 'Blue', value: Colors.blue),
                        Option(label: 'Red', value: Colors.red),
                        Option(label: 'Green', value: Colors.green),
                        Option(label: 'Purple', value: Colors.purple),
                        Option(label: 'Gray', value: Colors.grey),
                        Option(label: 'Brown', value: Colors.brown),
                        Option(label: 'Pink', value: Colors.pink),
                      ],
                    );

                    final hasBackground = context.knobs.boolean(
                      label: 'Show Background',
                      initial: false,
                    );

                    final backgroundColor = context.knobs.options<Color>(
                      label: 'Background Color',
                      initial: Colors.blue.shade50,
                      options: [
                        Option(label: 'Blue Light', value: Colors.blue.shade50),
                        Option(
                            label: 'Green Light', value: Colors.green.shade50),
                        Option(label: 'Red Light', value: Colors.red.shade50),
                        Option(
                            label: 'Yellow Light',
                            value: Colors.yellow.shade50),
                        Option(
                            label: 'Purple Light',
                            value: Colors.purple.shade50),
                        Option(
                            label: 'Gray Light', value: Colors.grey.shade200),
                        Option(label: 'White', value: Colors.white),
                      ],
                    );

                    final paddingValue = context.knobs.sliderInt(
                      label: 'Padding',
                      initial: 16,
                      min: 0,
                      max: 32,
                    );

                    final borderRadius = context.knobs.sliderInt(
                      label: 'Border Radius',
                      initial: 8,
                      min: 0,
                      max: 24,
                    );

                    return Container(
                      padding: EdgeInsets.all(paddingValue.toDouble()),
                      decoration: BoxDecoration(
                        color: hasBackground
                            ? backgroundColor
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(borderRadius.toDouble()),
                        border: hasBackground
                            ? Border.all(color: Colors.grey.shade300)
                            : null,
                      ),
                      child: TPETextGroup(
                        title: title,
                        description: description,
                        alignment: alignment,
                        crossAxisAlignment: crossAlignment,
                        textAlign: textAlign,
                        titleStyle: TPEText(
                          text: title,
                          variant: titleVariant,
                          color: titleColor,
                        ),
                        descriptionStyle: TPEText(
                          text: description,
                          variant: descVariant,
                          color: descColor,
                        ),
                      ),
                    );
                  },
                ),
                Story(
                  name: 'TPETextGroup / Color Examples',
                  builder: (context) {
                    return ListView(
                      children: [
                        _buildExampleSection(
                          context,
                          'Primary Colors',
                          [
                            _ExampleTextConfig(
                              title: 'Blue Theme',
                              description:
                                  'This text group uses blue colors for both title and description. Blue represents trust and professionalism.',
                              titleColor: Colors.blue.shade800,
                              descColor: Colors.blue.shade600,
                            ),
                            _ExampleTextConfig(
                              title: 'Green Theme',
                              description:
                                  'This text group uses green colors. Green represents growth, success, and environmental awareness.',
                              titleColor: Colors.green.shade800,
                              descColor: Colors.green.shade600,
                            ),
                            _ExampleTextConfig(
                              title: 'Red Theme',
                              description:
                                  'This text group uses red colors. Red represents urgency, importance, and attention.',
                              titleColor: Colors.red.shade800,
                              descColor: Colors.red.shade600,
                            ),
                          ],
                        ),
                        _buildExampleSection(
                          context,
                          'Secondary Colors',
                          [
                            _ExampleTextConfig(
                              title: 'Purple Theme',
                              description:
                                  'This text group uses purple colors. Purple represents creativity, luxury, and wisdom.',
                              titleColor: Colors.purple.shade800,
                              descColor: Colors.purple.shade600,
                            ),
                            _ExampleTextConfig(
                              title: 'Orange Theme',
                              description:
                                  'This text group uses orange colors. Orange represents energy, enthusiasm, and warmth.',
                              titleColor: Colors.orange.shade800,
                              descColor: Colors.orange.shade600,
                            ),
                            _ExampleTextConfig(
                              title: 'Teal Theme',
                              description:
                                  'This text group uses teal colors. Teal represents sophistication, balance, and calmness.',
                              titleColor: Colors.teal.shade800,
                              descColor: Colors.teal.shade600,
                            ),
                          ],
                        ),
                        _buildExampleSection(
                          context,
                          'Grayscale Colors',
                          [
                            _ExampleTextConfig(
                              title: 'Dark Gray Theme',
                              description:
                                  'This text group uses dark gray colors. Gray represents neutrality, formality, and professionalism.',
                              titleColor: Colors.grey.shade900,
                              descColor: Colors.grey.shade700,
                            ),
                            _ExampleTextConfig(
                              title: 'Medium Gray Theme',
                              description:
                                  'This text group uses medium gray colors. Gray is versatile and works well in many design contexts.',
                              titleColor: Colors.grey.shade700,
                              descColor: Colors.grey.shade500,
                            ),
                            _ExampleTextConfig(
                              title: 'Light Gray Theme',
                              description:
                                  'This text group uses light gray colors. Light gray is subtle and works well for secondary text.',
                              titleColor: Colors.grey.shade600,
                              descColor: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Story(
                  name: 'TPETextGroup / Text Variant Examples',
                  builder: (context) {
                    return ListView(
                      children: [
                        _buildExampleSection(
                          context,
                          'Different Text Variants',
                          [
                            _ExampleTextConfig(
                              title: 'Large Bold Title',
                              description:
                                  'This uses a large bold variant for the title and secondary for description.',
                              titleVariant: TPETextVariant.text20SemiBold700,
                              descVariant: TPETextVariant.secondary,
                            ),
                            _ExampleTextConfig(
                              title: 'Medium Regular',
                              description:
                                  'This uses medium regular variants for both title and description.',
                              titleVariant: TPETextVariant.text16SemiBold600,
                              descVariant: TPETextVariant.text16SemiBold600,
                            ),
                            _ExampleTextConfig(
                              title: 'Small Text',
                              description:
                                  'This uses small variants for both title and description. Good for captions and fine print.',
                              titleVariant: TPETextVariant.text14SemiBold600,
                              descVariant: TPETextVariant.text14SemiBold600,
                            ),
                          ],
                        ),
                        _buildExampleSection(
                          context,
                          'Primary and Secondary Variants',
                          [
                            _ExampleTextConfig(
                              title: 'Primary Title',
                              description:
                                  'This uses primary variant for title and secondary for description. A common combination.',
                              titleVariant: TPETextVariant.primary,
                              descVariant: TPETextVariant.secondary,
                            ),
                            _ExampleTextConfig(
                              title: 'Both Primary',
                              description:
                                  'This uses primary variant for both title and description. Creates a strong emphasis.',
                              titleVariant: TPETextVariant.primary,
                              descVariant: TPETextVariant.primary,
                            ),
                            _ExampleTextConfig(
                              title: 'Both Secondary',
                              description:
                                  'This uses secondary variant for both title and description. Creates a subtle, muted appearance.',
                              titleVariant: TPETextVariant.secondary,
                              descVariant: TPETextVariant.secondary,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Story(
                  name: 'TPETextGroup / Alignment Examples',
                  builder: (context) {
                    return ListView(
                      children: [
                        _buildExampleSection(
                          context,
                          'Text Alignment',
                          [
                            _ExampleTextConfig(
                              title: 'Left Aligned',
                              description:
                                  'This text is aligned to the left side of the container. Left alignment is commonly used for body text in many languages.',
                              textAlign: TextAlign.left,
                            ),
                            _ExampleTextConfig(
                              title: 'Center Aligned',
                              description:
                                  'This text is centered within its container. Center alignment is often used for headings and titles.',
                              textAlign: TextAlign.center,
                            ),
                            _ExampleTextConfig(
                              title: 'Right Aligned',
                              description:
                                  'This text is aligned to the right side of the container. Right alignment is sometimes used for dates or numbers.',
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        _buildExampleSection(
                          context,
                          'Vertical Alignment',
                          [
                            _ExampleTextConfig(
                              title: 'Top Aligned',
                              description:
                                  'This text group is aligned to the top of its container.',
                              alignment: MainAxisAlignment.start,
                            ),
                            _ExampleTextConfig(
                              title: 'Center Aligned',
                              description:
                                  'This text group is vertically centered in its container.',
                              alignment: MainAxisAlignment.center,
                            ),
                            _ExampleTextConfig(
                              title: 'Bottom Aligned',
                              description:
                                  'This text group is aligned to the bottom of its container.',
                              alignment: MainAxisAlignment.end,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Story(
                  name: 'TPETextGroup / Special Cases',
                  builder: (context) {
                    return ListView(
                      children: [
                        _buildExampleSection(
                          context,
                          'Long Text Examples',
                          [
                            _ExampleTextConfig(
                              title: 'Short Title',
                              description:
                                  'This is a very long description that should wrap properly and demonstrate how the text group handles lengthy content. The text should flow naturally and maintain proper spacing and alignment regardless of length.',
                              textAlign: TextAlign.justify,
                            ),
                            _ExampleTextConfig(
                              title:
                                  'Very Long Title That Might Wrap to Multiple Lines',
                              description: 'Short description.',
                              titleVariant: TPETextVariant.text16SemiBold600,
                            ),
                          ],
                        ),
                        _buildExampleSection(
                          context,
                          'Special Styling',
                          [
                            _ExampleTextConfig(
                              title: 'Success Message',
                              description:
                                  'This text represents a successful operation or positive confirmation.',
                              titleColor: Colors.green.shade800,
                              descColor: Colors.green.shade600,
                              backgroundColor: Colors.green.shade50,
                            ),
                            _ExampleTextConfig(
                              title: 'Warning Message',
                              description:
                                  'This text represents a warning or important notice that requires attention.',
                              titleColor: Colors.orange.shade800,
                              descColor: Colors.orange.shade600,
                              backgroundColor: Colors.orange.shade50,
                            ),
                            _ExampleTextConfig(
                              title: 'Error Message',
                              description:
                                  'This text represents an error or problem that needs to be addressed.',
                              titleColor: Colors.red.shade800,
                              descColor: Colors.red.shade600,
                              backgroundColor: Colors.red.shade50,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            )
          : Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const TPETextGroup(
                  title: 'Default Title',
                  description:
                      'To open a new account, please visit BRI branch office. New account registrations can only be processed at our branch office.',
                ),
              ),
            ),
    );
  }

  Widget _buildExampleSection(
    BuildContext context,
    String title,
    List<_ExampleTextConfig> configs,
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
          ...configs.map((config) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: config.backgroundColor ?? Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TPETextGroup(
                title: config.title,
                description: config.description,
                alignment: config.alignment,
                crossAxisAlignment: config.crossAlignment,
                textAlign: config.textAlign,
                titleStyle: TPEText(
                  text: config.title,
                  variant: config.titleVariant,
                  color: config.titleColor,
                ),
                descriptionStyle: TPEText(
                  text: config.description,
                  variant: config.descVariant,
                  color: config.descColor,
                ),
              ),
            );
          }).toList(),
          const SizedBox(height: 16),
          const Divider(),
        ],
      ),
    );
  }
}

class _ExampleTextConfig {
  final String title;
  final String description;
  final MainAxisAlignment alignment;
  final CrossAxisAlignment crossAlignment;
  final TextAlign textAlign;
  final TPETextVariant titleVariant;
  final TPETextVariant descVariant;
  final Color titleColor;
  final Color descColor;
  final Color? backgroundColor;

  _ExampleTextConfig({
    required this.title,
    required this.description,
    this.alignment = MainAxisAlignment.center,
    this.crossAlignment = CrossAxisAlignment.center,
    this.textAlign = TextAlign.center,
    this.titleVariant = TPETextVariant.text16SemiBold600,
    this.descVariant = TPETextVariant.secondary,
    this.titleColor = Colors.black,
    this.descColor = Colors.black54,
    this.backgroundColor,
  });
}
