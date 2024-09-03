import React from 'react';
import {
  Modal as ChakraModal,
  ModalOverlay,
  ModalContent,
  ModalHeader,
  ModalFooter,
  ModalBody,
  ModalCloseButton,
} from '@chakra-ui/react';

interface ModalProps {
  title: string;
  content: React.ReactNode;
  footer: React.ReactNode;
  onClose: () => void;
  isOpen: boolean;
}

const Modal: React.FC<ModalProps> = ({ title, content, footer, isOpen, onClose }) => {
  return (
    <ChakraModal isOpen={isOpen} onClose={onClose}>
      <ModalOverlay />
      <ModalContent>
        <ModalHeader>{title}</ModalHeader>
        <ModalCloseButton />
        <ModalBody>
          {content}
        </ModalBody>
        <ModalFooter>
          {footer}
        </ModalFooter>
      </ModalContent>
    </ChakraModal>
  );
};

export default Modal;
