# Mr.Cat 
# based on minimal, rangy and dcat

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class dcat(ColorScheme):
    progress_bar_color = 238

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                fg = red
            if context.border:
                fg = 239
            if context.media:
                    if context.image:
                            fg = yellow
                    else:
                            fg = green
            if context.container:
                attr |= bold
                fg = magenta
            if context.directory:
                attr |= bold
                fg = black
            elif context.executable and not \
                    any((context.media, context.container,
                       context.fifo, context.socket)):
                attr |= bold
                fg = green
            if context.socket:
                fg = magenta
                attr |= bold
            if context.fifo or context.device:
                fg = blue
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and white or black
            if context.bad:
                fg = magenta
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (black, white):
                    fg = yellow
                else:
                    fg = red
            if not context.selected and (context.cut or context.copied):
                fg = yellow
                bg = black
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    fg = black
            if context.badinfo:
                if attr & reverse:
                    bg = red
                else:
                    fg = white

        elif context.in_titlebar:
                attr |= bold
                if context.hostname:
                    attr |= bold
                    fg = context.bad and black or black
                elif context.directory:
                    fg = blue
                elif context.tab:
                    if context.good:
                        bg = green
                elif context.link:
                    fg = cyan

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = blue
                elif context.bad:
                    fg = red
            if context.marked:
                attr |= bold | reverse
                fg = black
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = yellow
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = red
                attr &= ~bold
            if context.vcscommit:
                fg = white
                attr &= ~bold


        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = yellow

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color


        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = yellow
            elif context.vcschanged:
                fg = red
            elif context.vcsunknown:
                fg = white
            elif context.vcsstaged:
                fg = yellow
            elif context.vcssync:
                fg = black
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = yellow
            elif context.vcsbehind:
                fg = white
            elif context.vcsahead:
                fg = red
            elif context.vcsdiverged:
                fg = black
            elif context.vcsunknown:
                fg = black

        return fg, bg, attr
