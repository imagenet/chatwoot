#!/bin/bash
# Script para sincronizar fork com repositório original (upstream)

# Configurações
BRANCH="develop" # altere se sua branch principal for 'master'

echo "🔄 Buscando alterações do repositório original..."
git fetch upstream

echo "📂 Indo para a branch $BRANCH..."
git checkout $BRANCH

echo "⬆️ Fazendo rebase do upstream/$BRANCH..."
git rebase upstream/$BRANCH

if [ $? -eq 0 ]; then
  echo "✅ Rebase concluído com sucesso!"
else
  echo "⚠️ Rebase encontrou conflitos. Resolva manualmente e depois rode:"
  echo "   git add ."
  echo "   git rebase --continue"
  exit 1
fi

echo "⬆️ Enviando alterações para o fork (origin/$BRANCH)..."
git push origin $BRANCH --force-with-lease --no-verify

echo "✨ Fork sincronizado com sucesso!"
