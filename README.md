#  .vim

  Vim configuration.

  Prerequisites
  -------------
  - **Recommendation**: Download [iPutty](https://github.com/iputty/iputty/wiki).

  - If you want to use an **original putty**, **edit font configuration**.
    - Window -> Appearance -> Font settings, font: **Consolas**, style: **normal**.

  Vim installation
  ----------------
  ```
  source ~/.vim/setup.sh
  ```

  Customized settings
  -------------------
  For more settings, you can refer to vimrc.
  - Move cursor by mouse (Drawback: Pasting the content from googling can be only in **insert** mode)
    - To disable: In vimrc, comment as shown in the below.
      ```vim
      "mouse=nvch
      ```

  - Move the split window by **TAB**

  Plugins
  -------
  For more plugins, you can refer to vimrc.
  - **NeoComplete** (**default**)
    - A plugins for auto completion.
    - References: https://github.com/Shougo/neocomplete.vim
    - Press **TAB** to select auto completion candidates.
#

  - **indentLine** (**default**)
    - Toggle: \ + i
    - To disable: In vimrc, remove the comment of the below line.
      ```vim
      let g:indentLine_enabled = 0
      ```
#

  - **colorscheme** (**default**)
    - To disable: In vimrc, comment as shown in the below.
      ```vim
      "colorscheme molokai
      ```

  How to update plugin
  ---------------------
  - Addition
    - In vimrc, add plugin install packages and some following settings.
  - Deletion
    - In vimrc, comment or delete plugin install packages.
  - To update the aforementioned changes:
    ```
    ~/.vim$ source update.sh
    ```
