class AddTrigramIndexToDictionaries < ActiveRecord::Migration[5.2]
  # An index can be created concurrently only outside of a transaction.
  disable_ddl_transaction!

  def up
    execute <<-SQL
      CREATE INDEX CONCURRENTLY dictionaries_on_word_idx ON dictionaries USING gin(word gin_trgm_ops);
    SQL
  end

  def down
    execute <<-SQL
      DROP INDEX dictionaries_on_word_idx;
    SQL
  end
end
