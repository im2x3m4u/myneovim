
return {
  cmd = {"pylsp"},
  filetypes = {"python"},
  settings = {
    pylsp = {
      configurationSources = {"flake8"},
      plugins = {
        jedi_completion = {enabled = true, fuzzy=false, eager = false, cache_for={"numpy", "scipy"}},
        jedi_hover = {enabled = true},
        jedi_references = {enabled = true},
        jedi_signature_help = {enabled = true},
        jedi_symbols = {enabled = true, all_scopes = true},
        pycodestyle = {enabled = false},
        flake8 = {
          enabled = false,
          ignore = {"E302", "E501"},
          maxLineLength = 160
        },
        mypy = {enabled = true},
        isort = {enabled = true},
        yapf = {enabled = false},
        pylint = {enabled = false},
        pyflakes = {enabled = false},
        pydocstyle = {enabled = false},
        mccabe = {enabled = false},
        ruff = {enabled = false},
        preload = {enabled = false},
        rope_completion = {enabled = false},
        rope_autoimport = {enabled = false}
      }
    }
  },
}
