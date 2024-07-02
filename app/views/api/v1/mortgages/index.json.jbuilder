# frozen_string_literal: true

json.mortgages do
  json.array! @mortgages do | mortgage |
    json.partial! "mortgage", mortgage:
  end
end
