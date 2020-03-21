class RenameTableTextsPostTexts < ActiveRecord::Migration[6.0]
  def change
    rename_table :texts, :post_texts
  end
end
