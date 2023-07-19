class Movement < ApplicationRecord
  enum :category, { saida: 'saida', entrada: 'entrada' }

  belongs_to :user

  validates :date, comparison: { less_than_or_equal_to: proc { Date.current } }
  validates :description, presence: true
  validates :description, length: { maximum: 80 }
  validates :value, presence: true
  validates :category, presence: true
  # validate :valida_se_existe_saldo

  def self.saldo_atual
    self.entrada.sum(:value) - self.saida.sum(:value)
  end

  def self.saldo_saida
    self.saida.sum(:value)
  end

  def self.saldo_entrada
    self.entrada.sum(:value)
  end


  private

  def valida_se_existe_saldo
    return unless user
    return if entrada?
    return if value.to_f <= user.movements.saldo_atual

    errors.add :value, 'não há saldo suficiente'
  end
end
