require 'rails_helper'

RSpec.describe Ability, type: :model do
  let(:ability) { Ability.new(user) }

  context 'without a user' do
    let(:user) { nil }

    it 'allows Posts to be read' do
      expect(ability.can? :read, Post).to eq true
    end
  end

  context 'with a user' do
    context 'user is not special' do
      let(:user) { create(:user) }

      it 'allows Posts to be read' do
        expect(ability.can? :read, Post).to eq true
      end

      it 'allows own Messages to be read' do
        sent_message = build(:message, sender: user)
        received_message = build(:message, recipient: user)

        expect(ability.can? :read, sent_message).to eq true
        expect(ability.can? :read, received_message).to eq true
      end

      it 'does not allow others Messages to be read' do
        message = build(:message)

        expect(ability.cannot? :read, message).to eq true
      end

      it 'allows management of own Posts' do
        post = build(:post, creator: user)

        expect(ability.can? :manage, post).to eq true
      end

      it 'does not allow deletion of messages' do
        expect(ability.cannot? :delete, Message).to eq true
      end

      it 'does not allow management of others Posts' do
        post = build(:post)

        expect(ability.cannot? :edit, post).to eq true
        expect(ability.cannot? :delete, post).to eq true
      end
    end

    context 'user is moderator' do
      let(:user) { create(:user, rank: 'moderator') }

      it 'allows management of all posts' do
        expect(ability.can? :manage, Post).to eq true
      end

      it 'does not allow management of everything' do
        expect(ability.cannot? :manage, :all).to eq true
      end
    end

    context 'user is administrator' do
      let(:user) { create(:user, rank: 'admin') }

      it 'allows management of everything' do
        expect(ability.can? :manage, :all).to eq true
      end
    end
  end
end
