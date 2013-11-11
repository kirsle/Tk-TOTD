# NAME

Tk::TOTD - Tip Of The Day dialog for Perl/Tk.

# SYNOPSIS

    use Tk::TOTD;

    my $top = MainWindow->new();

    my $totd = $top->TOTD (
      -title    => 'Tip Of The Day -- MyPerlApp',
      -messages => \@messages,
    );

    $totd->Show;

# DESCRIPTION

Tk::TOTD provides a simple Tip of the Day dialog for Perl/Tk programs.

# OPTIONS

The options recognized by __Show__ are as follows:

- __\-title__

    Specify the title of the Tip Of The Day dialog. Defaults to "Tip Of The Day"

- __\-messages__

    The array of tip messages. If omitted, a default 10 tips about this module
    will be used instead.

- __\-slogan__

    Set the slogan at the top of the dialog. Default is "Did you know that..."

- __\-image__

    A [Tk::Photo](https://metacpan.org/pod/Tk::Photo) object. If omitted, the default totd image is used. This default
    image is appropriate for most TOTD usages, but if you use this as something other
    than a Tip Of The Day you may want to use your own image. The default image's
    dimensions are __23x31__.

- __\-background__

    The main window's background color. Defaults to \#BFBFBF

- __\-leftbackground__

    Background color for the left panel (where the image and slide number is). Defaults
    to \#808080

- __\-mainbackground__

    The background color of the main content area. Defaults to \#FFFFFF (white).

- __\-slidecolor__

    The text color of the slide number (as on the left panel). Defaults to \#FFFF99.

- __\-foreground__

    Main foreground color of text. Defaults to \#000000 (black).

- __\-mainfont__

    The main font family used on most of the labels. Defaults to Arial.

- __\-mainfontsize__

    Font size of the main font. Defaults to 10.

- __\-titlefont__

    The font family used on the slogan text. Defaults to Times New Roman.

- __\-titlefontsize__

    Font size on the slogan text. Defaults to 14.

- __\-checklabel__

    The label on the checkbutton. Defaults to "Show tips at startup"

- __\-checkvariable__

    The variable to store the state of the checkbutton. 1 for checked, 0 for not.

- __\-closebutton__

    The text of the close button. Defaults to "Close"

- __\-nextbutton__

    The text of the next button. Defaults to "Next Tip"

# METHODS

- __Show (? options ?)__

    Displays the Tip Of The Day dialog. The TOTD dialog is based from Tk::DialogBox
    and therefore will pause your main window.

- __configure (? options ?)__

    Reconfigure previously set options.

- __destroy ()__

    Completely clean up the TOTD DialogBox. This method is a workaround for an
    underlying bug in `Tk::DialogBox` wherein if a DialogBox is open, and you
    close the `MainWindow` by clicking on the "X" button from the window manager,
    your program doesn't exit completely because the DialogBox is waiting on a
    variable that's only set when a button has been clicked.

    You can work around this bug by calling `destroy()` on your `Tk::TOTD`
    object when your `MainWindow` is exited.

        $mw->protocol('WM_DELETE_WINDOW', sub {
          $totd->destroy();
          exit(0);
        });

# CHANGES

    Version 0.4 - Nov 11 2013
    - Add the destroy() method to allow for a workaround to a bug in
      Tk::DialogBox.

    Version 0.3 - Nov  1 2013
    - Fix a bug where using the "Close" button on the dialog wouldn't dismiss the
      dialog properly, and the program would never exit gracefully again.

    Version 0.2 - Jan 16 2005
    - The widget now behaves as a DialogBox as it should, blocking the main window
      until closed.

# BUGS

None known yet.

# AUTHOR

Noah Petherbridge, http://www.kirsle.net/

This code is distributed under the same terms as Perl.
