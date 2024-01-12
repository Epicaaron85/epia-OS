local component = require("component")
local term = require("term")
local gpu = component.gpu

-- Fonction pour effacer la console
function clearConsole()
  term.clear()
end

-- Fonction pour écrire du texte en couleur
function writeColoredText(text, color)
  local previousColor = gpu.setForeground(color)
  io.write(text)
  gpu.setForeground(previousColor)
end

-- Fonction principale au démarrage
function startup()
  clearConsole()

  -- Écrire "YA" en rouge
  writeColoredText("ATTENTION : EPIA-OS EST ENCORE EN PHASE ALPHE ET EST INTERDIT A L'UTILISATION SANS AUTORISATION", 0xFF0000) -- Rouge en format RGB
  io.write("\n") -- Aller à la ligne

  -- Écrire "YO" en blanc
  writeColoredText("Bienvenue sur ", 0xFFFFFF) -- Blanc en format RGB
  writeColoredText("Epia-OS ", 0x009AFF)
  writeColoredText("Taper 'help' pour la liste des commands principales", 0xFFFFFF)
  io.write("\n") -- Aller à la ligne
end

-- Appeler la fonction au démarrage
startup()
