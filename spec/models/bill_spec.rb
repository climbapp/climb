require 'spec_helper'

describe Bill do
  it { should validate_presence_of :amount_due }
  it { should validate_presence_of :due_date }

  it { should belong_to :payee }

end