local wezterm = require 'wezterm'
local config = {}

-- 設定の初期化（新しいバージョン）
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- IME を有効にする
config.use_ime = true

-- フォント設定
config.font = wezterm.font('JetBrains Mono', { weight = 'Medium' })
config.font_size = 16.0

-- カラースキーム
config.color_schemes = {
  -- @see https://github.com/QuentinWatt/dark-flat-iterm-colors
  ['Dark Flat'] = {
    -- ANSI カラー (0-7: 通常色)
    ansi = {
      '#000000', -- black (Ansi 0)
      '#ee2c68', -- red (Ansi 1)
      '#3dd178', -- green (Ansi 2)
      '#ffc900', -- yellow (Ansi 3)
      '#00b0ff', -- blue (Ansi 4)
      '#ff4081', -- magenta (Ansi 5)
      '#64fcda', -- cyan (Ansi 6)
      '#ffffff', -- white (Ansi 7)
    },
    
    -- 明るい ANSI カラー (8-15: 明るい色)
    brights = {
      '#b0bec5', -- bright black (Ansi 8)
      '#ee3c76', -- bright red (Ansi 9)
      '#83f5a3', -- bright green (Ansi 10)
      '#ffe47e', -- bright yellow (Ansi 11)
      '#80d8ff', -- bright blue (Ansi 12)
      '#ff80ab', -- bright magenta (Ansi 13)
      '#a7ffeb', -- bright cyan (Ansi 14)
      '#ffffff', -- bright white (Ansi 15)
    },
    
    -- 背景色
    background = '#191a1a',
    
    -- 前景色（テキストの基本色）
    foreground = '#eceff1',
    
    -- カーソル関連
    cursor_bg = '#ee2c68',
    cursor_fg = '#000000',
    cursor_border = '#ee2c68',
    
    -- 選択範囲
    selection_bg = '#259b47',
    selection_fg = '#f1f1f1',
    
    -- URL リンク
    compose_cursor = '#005bb6',
    
    -- タブバー（オプション）
    tab_bar = {
      background = '#191a1a',
      active_tab = {
        bg_color = '#5d4090',
        fg_color = '#f1f1f1',
        intensity = 'Bold',
      },
      inactive_tab = {
        bg_color = '#3c4043',
        fg_color = '#b0bec5',
      },
      inactive_tab_hover = {
        bg_color = '#505055',
        fg_color = '#eceff1',
      },
      new_tab = {
        bg_color = '#191a1a',
        fg_color = '#b0bec5',
      },
      new_tab_hover = {
        bg_color = '#3c4043',
        fg_color = '#eceff1',
      },
    },
  },
}

-- カラースキームを適用
config.color_scheme = 'Dark Flat'

-- ウィンドウの設定
config.window_decorations = "RESIZE"

-- 起動時のウィンドウサイズ
config.initial_cols = 120
config.initial_rows = 30

-- タブバーの設定
config.tab_max_width = 100
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.show_new_tab_button_in_tab_bar = false

-- カーソルスタイル
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 1000

-- 背景の透明度（0.0-1.0）
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

-- スクロールバーを有効化
config.enable_scroll_bar = true

-- キーバインド
config.keys = {
  -- 新しいタブ
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  -- タブを閉じる
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  -- 水平分割
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- 垂直分割
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- ペイン移動
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
}

-- マウス操作
config.mouse_bindings = {
  -- 右クリックでペースト
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}

-- スクロールバックの履歴数
config.scrollback_lines = 10000

-- 警告を無効化
config.audible_bell = 'Disabled'
config.window_close_confirmation = "NeverPrompt"

-- ウィンドウパディングで余白を調整
config.window_padding = {
  left = 20,
  right = 20,
  top = 10,
  bottom = 50,
}

return config
